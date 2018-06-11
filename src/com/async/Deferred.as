/**
 * Created by huangcb on 2017/12/2.
 */
package com.async {
import laya.utils.Handler;

public class Deferred
{
    private static const PENDING : uint = 0;
    private static const RESOLVED : uint = 1;
    private static const REJECTED : uint = 2;
    private static const ABORTED : uint = 3;

    private var _completeListeners : Vector.<Handler> = new Vector.<Handler>();
    private var _failListeners : Vector.<Handler> = new Vector.<Handler>();
    private var _progressListeners : Vector.<Handler> = new Vector.<Handler>();

    private var _finalCallback : Handler;
    private var _state : uint = PENDING;
    private var _outcome : *;
    public  function Deferred(){

    }
    public function resolve(outcome : * = null) : void
    {
        if (_state != PENDING) {
            return;
        }

        _outcome = outcome;
        _state = RESOLVED;

        const len : uint = _completeListeners.length;
        for (var i : uint = 0; i < len; i++) {
            _completeListeners[i].runWith(_outcome);
        }

        clearListeners();
        invokeFinalCallback();
    }

    public function reject(error : Error) : void
    {
        if (_state != PENDING) {
            return;
        }

        _outcome = error || new Error("Promise Rejected");
        _state = REJECTED;

        const len : uint = _failListeners.length;
        for (var i : uint = 0; i < len; i++) {
            _failListeners[i].runWith(_outcome);
        }

        clearListeners();
        invokeFinalCallback();
    }

    public function progress(ratioComplete : Number) : void
    {
        const len : uint = _progressListeners.length;
        for (var i : uint = 0; i < len; i++) {
            _progressListeners[i].runWith(ratioComplete);
        }
    }

    public function abort() : void
    {
        _state = ABORTED;
        _outcome = null;
        _finalCallback = null;

        clearListeners();
    }

    public function completes(callback : Handler) : Deferred
    {
        if (_state == PENDING) {
            _completeListeners.push(callback);
        }
        else if (_state == RESOLVED) {
            callback.runWith(_outcome);
        }

        return this;
    }

    public function fails(callback : Handler) : Deferred
    {
        if (_state == PENDING) {
            _failListeners.push(callback);
        }
        else if (_state == REJECTED) {
            callback.runWith(_outcome);
        }

        return this;
    }

    public function progresses(callback : Handler) : Deferred
    {
        if (_state == PENDING) {
            _progressListeners.push(callback);
        }

        return this;
    }

    public function thenFinally(callback : Handler) : void
    {
        if (_state == PENDING) {
            _finalCallback = callback;
        }
        else {
            callback.run();
        }
    }

    private function clearListeners() : void
    {
        _completeListeners = null;
        _failListeners = null;
        _progressListeners  = null;
        _finalCallback = null;
    }

    private function invokeFinalCallback() : void
    {
        if (_finalCallback !== null) {
            _finalCallback.run();
            _finalCallback = null;
        }
    }
}
}
