/**
 * Created by huangcb on 2017/8/26.
 */
package com.game.vo {
import com.game.module.heroic.vo.HeroVO;
import com.game.utils.UserUtil;

import globals.ConfigLocator;

import lang.LangArrayTxt;
import lang.LangTxt;

import laya.utils.Dictionary;

import net.consts.StaticConfig;

import utils.HtmlUtil;
import utils.StringUtil;

public class GernalHeroVO  {

    /** 基础属性 列表*/
    // 性别    0表示男性  1表示女性  2表示童子（非男女）
    public var sex : int ;
    // 职业Id 根据职业Id取得相关职业的信息			其中0表示儒，1表示释，2表示道   4墨     9妖
    public var careerId : int ;

    // 类型  表示当前的将的类型  0主将  1是普通 2是传奇
    public var type : int = 1;
    // 对应头像ID
    public var imgId : int;



    /** 全部散仙类型 */
    public static var TYPES : Array = LangArrayTxt.HERO_TYPES;
    /** 全部性别 */
    public static var SEXS : Array = LangArrayTxt.SEXARRAY ;
    // 简介
    public var info : String = "这个散仙很牛逼";

    // 基础力量
    public var strength_base : Number = 10;
    // 基础敏捷
    public var quick_base : Number = 10;
    // 基础智力
    public var intelligence_base : Number = 10 ;
    // 基础耐力
    public var endurance_base : Number = 10;
    // 基础意志
    public var willpower_base : Number = 10;
    // 基础属性值   主要是名将可能有变化
    // 基础元神力上限
    public var soul_max_base : int = 20;
    // 基础体力(血上限)
    public var p_s_base : Number = 20;

    // 基础灵气(影响无双技能伤害)
    public var aura_base : Number = 100;


    // 基础法术抵挡(影响无双技能伤害)
    public var dodge_magic_base : Number = 20;
    // 基础物理攻击力
    public var attack_base : Number = 5;
    // 基础物理防御力
    public var def_base : Number = 0;
    // 基础法术攻击力
    public var attack_magic_base : Number = 20;
    // 基础法术防御
    public var def_magic_base : Number = 20;
    // 基础命中
    public var hit_base : Number = 90;
    // 基础躲避
    public var dodge_base : Number = 0;
    // 基础暴击
    public var crit_base : Number = 0 ;
    // 基础暴击伤害倍数
    public var crit_times_base : Number = 0 ;
    // 基础坚韧
    public var tough_base : Number = 0 ;
    // 基础反击
    public var repel_base : Number = 0 ;
    // 基础破击
    public var broke_base : Number = 0;
    // 基础身法
    public var act_base : Number = 0;
    // 基础修炼经验值
    public var p_exp_base : uint = 50000;
    // 基础可获得最大修炼经验值
    public var p_exp_max_base : uint = 50000;
    public var id:int;
    public var name:String;
    public var level:int;
    public var potential_1:int;
    public var potential_2:int;
    public var aura_start_base:Number;
    public var generalSkill:int;
    /*职业是否进阶 儒释道墨对应圣佛尊帝*/
    public var careerUpgrade:Boolean;
    /*获取性别名称*/
    public function get sexString() : String {
        return (sex == 0) ? SEXS[0] : SEXS[1];
    }
    /*获取散仙职业名称*/
    public function get careerName() : String {
        var  careers:Array = LangArrayTxt.NEW_HERO_CAREERS;
        if(careerId < 8)
        {
            var fp:int = careerUpgrade?careerId + 4:careerId;
            return careers[fp];
        }
        else
        {
            fp = careerUpgrade ? 9 : 8;
            return careers[fp];
        }
    }
    public function get nameColor() : int {
        // 散仙的好坏 的划分
        var len : int = HeroVO.POTENTINAL.length;

        for (var i : int = 0 ; i < len ; i++) {
            if (potential_1 < HeroVO.POTENTINAL[i]){
                return HeroVO.COLOR[i];
            }
        }
        return 0xFFFFFF;
    }



}
}
