/**
 * Created by dangww on 2017/8/31.
 */
package globals {
public class FormulaConfig {
    public function FormulaConfig() {
    }
    public var strength_crit : Number;
    public var quick_dodge : Number;
    public var willpower_dodge : Number;
    public var intelligence_broke : Number;
    /**
     *力量转攻击力
     */
    public var strength_attack : Number = 2;
    /**
     *敏捷转物防
     */
    public var quick_def : Number = 0.7	;
    /**
     *耐力转生命
     */
    public var endurance_hp : Number = 7.5;
    /**
     *意志转法防
     */
    public var willpower_def : Number = 12;
    /**
     *智力转法攻
     */
    public var intelligence_attack : Number = 2;
    private var _hit_code : String;
    private var _dodge_code : String;
    private var _break_code : String;
    private var _touch_code : String;
    private var _magic_dodge_code : String;
    private var _repel_code : String;
    private var _def_code : String;
    private var _magic_def_code : String;
    private var _crit_code : String;
    public var _hit_pm1 : int;
    public var _hit_pm2 : int;
    public var _hit_pm3 : int;
    public var _crit_pm1 : int;
    public var _crit_pm2 : int;
    public var _crit_pm3 : int;
    public var _dodge_pm1 : int;
    public var _dodge_pm2 : int;
    public var _dodge_pm3 : int;
    public var _break_pm1 : int;
    public var _break_pm2 : int;
    public var _break_pm3 : int;
    public var _def_pm1 : int;
    public var _def_pm2 : int;
    public var _def_pm3 : int;
    public var _magic_dodge_pm1 : int;
    public var _magic_dodge_pm2 : int;
    public var _magic_dodge_pm3 : int;
    public var _repel_pm1 : int;
    public var _repel_pm2 : int;
    public var _repel_pm3 : int;
    public var _touch_pm1 : int;
    public var _touch_pm2 : int;
    public var _touch_pm3 : int;
    public var _magic_def_pm1 : int;
    public var _magic_def_pm2 : int;
    public var _magic_def_pm3 : int;
    public var _crit_times_pm3 : int = 300;

    public function set hit_code(hit_code : String) : void {
        _hit_code = hit_code;
        var arr : Array = _hit_code.split(',');
        _hit_pm1 = parseInt(arr[0]);
        _hit_pm2 = parseInt(arr[1]);
        _hit_pm3 = parseInt(arr[2]);
    }

    public function set dodge_code(dodge_code : String) : void {
        _dodge_code = dodge_code;
        var arr : Array = _dodge_code.split(',');
        _dodge_pm1 = parseInt(arr[0]);
        _dodge_pm2 = parseInt(arr[1]);
        _dodge_pm3 = parseInt(arr[2]);
    }

    public function set break_code(break_code : String) : void {
        _break_code = break_code;
        var arr : Array = _break_code.split(',');
        _break_pm1 = parseInt(arr[0]);
        _break_pm2 = parseInt(arr[1]);
        _break_pm3 = parseInt(arr[2]);
    }

    public function set touch_code(touch_code : String) : void {
        _touch_code = touch_code;
        var arr : Array = _touch_code.split(',');
        _touch_pm1 = parseInt(arr[0]);
        _touch_pm2 = parseInt(arr[1]);
        _touch_pm3 = parseInt(arr[2]);
    }

    public function set magic_dodge_code(magic_dodge_code : String) : void {
        _magic_dodge_code = magic_dodge_code;
        var arr : Array = _magic_dodge_code.split(',');
        _magic_dodge_pm1 = parseInt(arr[0]);
        _magic_dodge_pm2 = parseInt(arr[1]);
        _magic_dodge_pm3 = parseInt(arr[2]);
    }

    public function set repel_code(repel_code : String) : void {
        _repel_code = repel_code;
        var arr : Array = _repel_code.split(',');
        _repel_pm1 = parseInt(arr[0]);
        _repel_pm2 = parseInt(arr[1]);
        _repel_pm3 = parseInt(arr[2]);
    }

    public function set def_code(def_code : String) : void {
        _def_code = def_code;
        var arr : Array = _def_code.split(',');
        _def_pm1 = parseInt(arr[0]);
        _def_pm2 = parseInt(arr[1]);
        _def_pm3 = parseInt(arr[2]);
    }

    public function set magic_def_code(magic_def_code : String) : void {
        _magic_def_code = magic_def_code;
        var arr : Array = _magic_def_code.split(',');
        _magic_def_pm1 = parseInt(arr[0]);
        _magic_def_pm2 = parseInt(arr[1]);
        _magic_def_pm3 = parseInt(arr[2]);
    }

    public function set crit_code(crit_code : String) : void {
        _crit_code = crit_code;
        var arr : Array = _crit_code.split(',');
        _crit_pm1 = parseInt(arr[0]);
        _crit_pm2 = parseInt(arr[1]);
        _crit_pm3 = parseInt(arr[2]);
    }
}
}
