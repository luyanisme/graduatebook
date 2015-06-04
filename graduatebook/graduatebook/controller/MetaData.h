//
//  MetaData.h
//  xiaoshutong
//
//  Created by wangkai on 4/8/15.
//  Copyright (c) 2015 sencloudx. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SCHOOL_FUNCTION;
@class CHILD_INFO;
@class DEVICE_INFO;
@class USER_INFO;
@class CLASS_INFO;
@class PRESENCE_REQUEST;
@class PRESENCE_RECORD;
@class MEALS_REQUEST;
@class MEALS_TIME;
@class MEALS_WEEK;
@class MEALS_INFO;
@class MEALS_ITEM;
@class SEMESTER_INFO;
@class PERSONAL_SETTING;
@class CITY_INFO;
@class REGION_INFO;
@class BABY_DETAIL;
@class PROVINCE_INFO;
@class PROVINCE_LIST;
@class MODIFY_USERINOF;
@class MODIFY_BABYINFO;
@class IDENTIFY_INFO;
@class NEWS_CATEGORY;
@class NEWS_SUMMARY;
@class NEWS_CONTENT;
@class ANNOUNCE_CONTENT;
@class SCHOOL_INTRODUCE;
@class ANNOUNCE_SUMMARY;
@class VERIFICATION_INOF;
@class ALBUMS_INFO;
@class ALBUM_IMAGE;
@class ADD_PRESENCE;
@class HELP_INFO;
@class ACCOUNT_INFO;
@class NOTIFICATION_INFO;
@class PAGINATION;
@class LEAVE_REQUEST;
@class COURSE_DETAIL;
@class COURSE_WEEKPLAN;
@class FEEDBACK_INFO;
@class NOTIFICATION_SETTING;
@class POSTERS_INOF;
@class MOREAPP_INFO;
@class BUDDY_GROUP;
@class BUDDY_INFO;
@class LOCAL_ACCOUNT;
@class LOCAL_CONTACTS;
@class RECIPIENT_INFO;
@class SEND_NOTIFY;
@class AUTOLOGIN_FLAG;
@class BADGE_NUM;

#pragma mark - 功能按键展示所需参数
@interface SCHOOL_FUNCTION : NSObject
@property (nonatomic, strong) NSNumber* id;  //标示选择的不同内容
@property (nonatomic, strong) NSString* functionImage;
@property (nonatomic, strong) NSString* functionName;

@end

#pragma mark -- 学生信息
@interface CHILD_INFO : NSObject
@property (nonatomic, strong) NSString* name;          // 班级名
@property (nonatomic, strong) NSString* studentName;   // 姓名
@property (nonatomic, strong) NSString* studentNo;     // 学号
@property (nonatomic, strong) NSNumber* dictClassId;   // 班级号
@property (nonatomic, strong) NSString* cardNumber;    //ic卡号
@end

#pragma mark - 设备信息
@interface DEVICE_INFO : NSObject
@property (nonatomic, strong) NSString* isoCountryCode;
@property (nonatomic, strong) NSString* carrierName;
@property (nonatomic, strong) NSString* mobileCountryCode;
@property (nonatomic, strong) NSString* deviceName;
@property (nonatomic, strong) NSString* deviceModel;
@property (nonatomic, strong) NSString* uuid;
@property (nonatomic, strong) NSString* osName;
@property (nonatomic, strong) NSString* deviceOs;
@property (nonatomic, strong) NSString* osVersion;
@property (nonatomic, strong) NSString* userName; //手机名称
@property (nonatomic, strong) NSString* macAddress;
@property (nonatomic, strong) NSString* localLanguage;
@property (nonatomic, strong) NSString* appver;   //app版本
@property (nonatomic, strong) NSString* appid;
@property (nonatomic, strong) NSString* env;
@property (nonatomic, strong) NSString* deviceToken;
@property (nonatomic, strong) NSString* altitude;    //海拔高度
@property (nonatomic, strong) NSString* speed;
@property (nonatomic, strong) NSString* longitude;   //经度
@property (nonatomic, strong) NSString* timezone;
@property (nonatomic, strong) NSString* latitude;    //纬度
@property (nonatomic, strong) NSString* accuracy;    //水平精度
@property (nonatomic, strong) NSString* timestamp;   //时间戳
@property (nonatomic, strong) NSString* heading;     //朝向
@property (nonatomic, strong) NSString* altitudeAccuracy;  //垂直精度

@end

#pragma mark - 家长、老师登录成功信息
@interface USER_INFO : NSObject
@property (nonatomic, strong) NSString* dictSchool;
@property (nonatomic, strong) NSNumber* dictSchoolId;
@property (nonatomic, strong) NSNumber* memberId;     //用户id
@property (nonatomic, strong) NSString* memberType;
@property (nonatomic, strong) NSArray* studentInfos;
@property (nonatomic, strong) NSString* realName;
@property (nonatomic, strong) NSString* schoolLogo;//学校logo
@property (nonatomic, strong) NSString* schoolName;//学校名称
@property (nonatomic, strong) NSString* bgColor;//学校色调
@property (nonatomic, strong) NSString* iconPhoto;//用户头像信息
@end

#pragma mark - 班级信息
@interface CLASS_INFO : NSObject

@property(nonatomic, strong) NSString* cmaster;  //老师名字
@property(nonatomic, strong) NSNumber* id;
@property(nonatomic, strong) NSString* description;
@property(nonatomic, strong) NSString* name;   //班级名字
@property(nonatomic, assign) BOOL      isSelected;

@end


#pragma mark -- 考勤请求信息
@interface PRESENCE_REQUEST : NSObject

@property(nonatomic, strong) NSString* date;
@property(nonatomic, strong) NSString* studentNo;
@property(nonatomic, strong) NSString* memberType;
@property(nonatomic, strong) NSNumber* dictClassId;
@property(nonatomic, strong) NSNumber* memberId;

@end

#pragma mark -- 考勤记录信息
@interface PRESENCE_RECORD : NSObject

@property(nonatomic, strong) NSString* enterDate;
@property(nonatomic, strong) NSString* leaveDate;
@property(nonatomic, strong) NSString* status;
@property(nonatomic, strong) NSString* statusName;
@property(nonatomic, strong) NSString* studentName;
@property(nonatomic, strong) NSString* iconPhoto;
@property(nonatomic, strong) NSString* attendanceDate;

@end

#pragma mark -- 食谱请求
@interface MEALS_REQUEST : NSObject

@property(nonatomic, strong) NSString* year;     //当前年
@property(nonatomic, strong) NSString* month;    //第几月
@property(nonatomic, strong) NSString* week;     //第几周

@end

#pragma mark 周列表信息
@interface MEALS_TIME : NSObject

@property(nonatomic, strong) NSNumber* id;
@property(nonatomic, strong) NSNumber* week;
@property(nonatomic, strong) NSNumber* month;
@property(nonatomic, strong) NSNumber* year;
@property(nonatomic, strong) NSString* createDate;
@property(nonatomic, strong) NSNumber* isCurrent;

@end

@interface MEALS_ALL : NSObject

@property(nonatomic, strong) NSString* weekStartDate;
@property(nonatomic, strong) NSArray*  recipeWeekDays;
@property(nonatomic, strong) NSString* weekEndDate;
@property(nonatomic, strong) NSNumber* week;

@end

#pragma mark -- 一周的食谱信息
@interface MEALS_WEEK : NSObject

@property(nonatomic, strong) NSNumber* id;
@property(nonatomic, strong) NSNumber* weekDay;
@property(nonatomic, strong) NSArray* recipeSections;

@end

#pragma mark -- 食谱信息
@interface MEALS_INFO : NSObject
@property(nonatomic, strong) NSString* sectionName;
@property(nonatomic, strong) NSNumber* id;
@property(nonatomic, strong) NSString* description;
@property(nonatomic, strong) NSArray*  recipeImages;
@end

#pragma mark -- 食品信息
@interface MEALS_ITEM : NSObject
@property(nonatomic, strong) NSNumber* id;
@property(nonatomic, strong) NSString* dishImage;
@end

#pragma mark --学年信息
@interface SEMESTER_INFO : NSObject
@property(nonatomic, strong) NSNumber* id;
@property(nonatomic, strong) NSString* startYear;
@property(nonatomic, strong) NSString* endYear;
@property(nonatomic, strong) NSString* term;
@property(nonatomic, assign) NSNumber* isCurrent;
@end

#pragma mark -- 课程信息
@interface COURSE_INFO : NSObject
@property(nonatomic, strong) NSNumber* id;
@property(nonatomic, strong) NSString* endTime;
@property(nonatomic, strong) NSNumber* week;
@property(nonatomic, strong) NSString* teacherName;
@property(nonatomic, strong) NSString* lessons;
@property(nonatomic, strong) NSString* classRoom;
@property(nonatomic, strong) NSString* startTime;
@property(nonatomic, strong) NSString* courseName;

@end

#pragma mark-- city info
@interface CITY_INFO : NSObject
@property(nonatomic, strong) NSNumber* id;
@property(nonatomic, strong) NSString* name;
@property(nonatomic, strong) NSArray* citys;
@end

#pragma mark-- region info
@interface REGION_INFO : NSObject
@property(nonatomic, strong) NSNumber* id;
@property(nonatomic, strong) NSString* name;

@end

#pragma mark-- province info
@interface PROVINCE_INFO : NSObject

@property(nonatomic, strong) NSNumber* id;
@property(nonatomic, strong) NSString* name;

@end

#pragma mark-- 宝贝 info
@interface BABY_DETAIL : NSObject
@property(nonatomic, strong) NSString* gender;
@property(nonatomic, strong) NSNumber* studentId;
@property(nonatomic, strong) NSString* studnetNo;
@property(nonatomic, strong) NSString* birthday;
@property(nonatomic, strong) NSString* studentName;
@property(nonatomic, strong) NSString* genderName;
@property(nonatomic, strong) NSString* iconPhoto;
@property(nonatomic, strong) NSString* type;
@property(nonatomic, strong) NSString* typeName;
@end

#pragma mark-- 个人资料设置
@interface PERSONAL_SETTING : NSObject

@property(nonatomic, strong) NSString* mobile;
@property(nonatomic, strong) CITY_INFO* city;
@property(nonatomic, strong) NSString* realName;
@property(nonatomic, strong) REGION_INFO* region;
@property(nonatomic, strong) NSArray* dictStudents;
@property(nonatomic, strong) PROVINCE_INFO* province;
@property(nonatomic, strong) NSString* iconPhoto;

@end

#pragma mark-- 省份信息
@interface PROVINCE_LIST : NSObject

@property(nonatomic, strong) NSArray* citys;
@property(nonatomic, strong) NSNumber* id;
@property(nonatomic, strong) NSString* name;

@end

#pragma mark-- 个人资料修改
@interface MODIFY_USERINOF : NSObject
@property(nonatomic, strong) NSNumber* memberId;
@property(nonatomic, strong) NSString* realName;
@property(nonatomic, strong) NSNumber* areaId;
@property(nonatomic, strong) NSString* mobile;
@property(nonatomic, strong) NSString* oldPassword;
@property(nonatomic, strong) NSString* password;
@property(nonatomic, strong) NSString* type;
@property(nonatomic, strong) NSString* iconPhoto;

@end

#pragma mark-- 小孩资料修改
@interface MODIFY_BABYINFO : NSObject
@property(nonatomic, strong) NSNumber* studentId;
@property(nonatomic, strong) NSString* studentName;
@property(nonatomic, strong) NSString* gender;
@property(nonatomic, strong) NSString* birthday;
@property(nonatomic, strong) NSString* type;
@property(nonatomic, strong) NSString* modifyType;
@property(nonatomic, strong) NSNumber* memberId;
@property(nonatomic, strong) NSString* iconPhoto;
@end

#pragma mark-- 身份信息
@interface IDENTIFY_INFO : NSObject

@property(nonatomic, strong) NSString* typeName;
@property(nonatomic, strong) NSString* type;

@end

#pragma mark-- 新闻种类
@interface NEWS_CATEGORY : NSObject

@property(nonatomic, strong) NSNumber* id;
@property(nonatomic, strong) NSString* categoryName;
@property(nonatomic, assign) BOOL isSelected;

@end

#pragma mark-- 新闻概要信息
@interface NEWS_SUMMARY : NSObject

@property(nonatomic, strong) NSNumber* id;
@property(nonatomic, strong) NSString* summary;
@property(nonatomic, strong) NSString* title;
@property(nonatomic, strong) NSString* smallIconfile;

@end

#pragma mark-- 新闻、公告具体内容信息
@interface NEWS_CONTENT : NSObject

@property(nonatomic, strong) NSString* summary;
@property(nonatomic, strong) NSString* content;
@property(nonatomic, strong) NSString* author;
@property(nonatomic, strong) NSString* title;
@property(nonatomic, strong) NSString* viewCount;
@property(nonatomic, strong) NSString* source;
@property(nonatomic, strong) NSString* detailUrl;
@property(nonatomic, strong) NSString* smallIconfile;
@property(nonatomic, strong) NSString* timePublish;
@end

#pragma mark 公告具体内容信息
@interface ANNOUNCE_CONTENT : NSObject

@property(nonatomic, strong) NSString* summary;
@property(nonatomic, strong) NSString* content;
@property(nonatomic, strong) NSString* author;
@property(nonatomic, strong) NSString* source;
@property(nonatomic, strong) NSString* timePublish;
@property(nonatomic, strong) NSString* title;
@property(nonatomic, strong) NSString* viewCount;

@end


#pragma mark-- 新闻概要信息
@interface SCHOOL_INTRODUCE : NSObject

@property(nonatomic, strong) NSString* introduction;
@property(nonatomic, strong) NSString* schoolBadge;
@property(nonatomic, strong) NSString* schoolMotto;
@property(nonatomic, strong) NSString* schoolSong;
@property(nonatomic, strong) NSString* indexImage;
@end

#pragma mark-- 新闻概要信息
@interface ANNOUNCE_SUMMARY : NSObject

@property(nonatomic, strong) NSNumber* id;
@property(nonatomic, strong) NSString* summary;
@property(nonatomic, strong) NSString* title;
@property(nonatomic, strong) NSString* smallIconfile;

@end

#pragma mark-- 验证码信息
@interface VERIFICATION_INOF : NSObject

@property(nonatomic, strong) NSString* safeKey;
@property(nonatomic, strong) NSString* validateCode;
@property(nonatomic, strong) NSString* phoneNumber;

@end

#pragma mark-- 校园相册信息
@interface ALBUMS_INFO : NSObject

@property(nonatomic, strong) NSString* longitude;
@property(nonatomic, strong) NSNumber* id;
@property(nonatomic, strong) NSString* locationName;
@property(nonatomic, strong) NSString* lastUpdateTime;
@property(nonatomic, strong) NSString* latitude;
@property(nonatomic, strong) NSString* description;
@property(nonatomic, strong) NSString* viewCount;
@property(nonatomic, strong) NSArray*  campusviewImageAttachs;
@property(nonatomic, strong) NSString* favoriteCount;
@property(nonatomic, strong) NSString* coverImage;
@property(nonatomic, strong) NSString* lastUpdator;

@end

#pragma mark-- 校园相册照片信息
@interface ALBUM_IMAGE : NSObject
@property(nonatomic, strong) NSString* imageAttach;
@property(nonatomic, strong) NSNumber* id;
@end

#pragma mark-- 增加考勤记录
@interface ADD_PRESENCE : NSObject

@property(nonatomic, strong) NSString* device;
@property(nonatomic, strong) NSString* systemInfo;
@property(nonatomic, strong) NSString* cardNumber;

@end

#pragma mark 测试参数 多账号信息
@interface ACCOUNT_INFO : NSObject
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* info;
@property (strong, nonatomic) NSNumber* accountId;
@end

#pragma mark 测试参数  帮助信息
@interface HELP_INFO : NSObject
@property (strong, nonatomic) NSString* question;
@property (strong, nonatomic) NSString* content;
@property (strong, nonatomic) NSNumber* helpId;
@property (assign, nonatomic) BOOL isExpand;
@end

@interface NOTIFICATION_REQ : NSObject
////消息类型 通知--NOTICE  新闻--NEWS 公告通知 ANNOUNCEMENT 请假通知 ASKLEAVE
//@property(nonatomic, strong) NSString* msgCategory;
//请求类型 接收到得通知receive 发送的通知send
@property(nonatomic, strong) NSString* type;

@end


/**
 *  消息格式
 */
@interface NOTIFICATION_INFO : NSObject
@property (nonatomic, strong) NSNumber* id;
@property (nonatomic, strong) NSString* realName;
@property (nonatomic, strong) NSString* body;
@property (nonatomic, strong) NSString* subject;
@property (nonatomic, strong) NSString* createDate;
@property (nonatomic, assign) NSNumber* adjust;        // 0 不可跳转
@property (nonatomic, strong) NSString* iconPhoto;
@property (nonatomic, assign) NSNumber* receiverRead;  // 0 未读
@property (nonatomic, assign) BOOL isExpand;
@property (nonatomic, strong) NSString* messageCategory;
@property (nonatomic, strong) NSNumber* transferId;
@end

#pragma mark-- 页码标记
@interface PAGINATION : NSObject
@property (nonatomic, strong) NSNumber *		pageNumber;
@property (nonatomic, strong) NSNumber *		pageSize;

@end


@interface LEAVE_REQUEST : NSObject
@property (nonatomic, strong) NSString* leaveStartDate;
@property (nonatomic, strong) NSString* leaveEndDate;
@property (nonatomic, strong) NSNumber* memberId;
@property (nonatomic, strong) NSString* stuNo;
@property (nonatomic, strong) NSString* description;
@property (nonatomic, strong) NSString* askLeaveType;

@end

#pragma mark 本地记录用户登录过的账号
@interface LOCAL_ACCOUNT : BeeActiveRecord
@property (strong, nonatomic) NSString* accountNum;//用户名
@property (strong, nonatomic) NSString* password;//密码
@property (strong, nonatomic) NSNumber* isSelect;//是否最新登录账号
@property (strong, nonatomic) NSString* iconPhoto;//用户头像信息
@property (nonatomic, strong) NSString* realName;//用户名字信息
@property (nonatomic, strong) NSNumber* memberId;     //用户id
@property (nonatomic, strong) NSString *memberType;//用户信息
@property (nonatomic, strong) USER_INFO *userInfo;
@end
#pragma mark - 课程界面
@interface COURSE_DETAIL : NSObject

@property (nonatomic,strong) NSString* fridayImage;
@property (nonatomic,strong) NSString* thursdayDesc;
@property (nonatomic,strong) NSString* tuesdayImage;
@property (nonatomic,strong) NSString* wednesdayImage;
@property (nonatomic,strong) NSString* wednesdayDesc;
@property (nonatomic,strong) NSString* thursday;
@property (nonatomic,strong) NSString* friday;
@property (nonatomic,strong) NSString* fridayDesc;
@property (nonatomic,strong) NSString* mondayDesc;
@property (nonatomic,strong) NSString* planSection;
@property (nonatomic,strong) NSString* monday;
@property (nonatomic,strong) NSString* tuesday;
@property (nonatomic,strong) NSString* wednesday;
@property (nonatomic,strong) NSString* mondayImage;
@property (nonatomic,strong) NSString* tuesdayDesc;
@property (nonatomic,strong) NSString* thursdayImage;
@end

#pragma mark -- 课程周计划列表
@interface COURSE_WEEKPLAN : NSObject

@property(nonatomic, strong) NSString* weekStartDate;
@property (nonatomic, strong) NSNumber* id;
@property (nonatomic, strong) NSNumber* week;
@property (nonatomic, strong) NSString* weekEndDate;
@property (nonatomic, strong) NSString* weekSubject;
@property (nonatomic, strong) NSString* isCurrent;
@end

@interface NOTIFICATION_SETTING : BeeActiveRecord
@property (strong, nonatomic) NSNumber* playSound;//新消息来时是否播放声音
@property (strong, nonatomic) NSNumber* playVibration;//新消息来时是否振动
@property (strong, nonatomic) NSString* dataName;//存储的名字，用于查找更新
@property (strong, nonatomic) NSNumber* receiveNotify;  //接受新通知

@end

#pragma mark -- 意见反馈信息
@interface FEEDBACK_INFO : NSObject

@property (strong, nonatomic) NSString* suggestContent;
@property (strong, nonatomic) NSString* suggestDate;
@property (strong, nonatomic) NSString* deviceModel;
@property (strong, nonatomic) NSString* uuid;
@property (strong, nonatomic) NSString* osName;
@property (strong, nonatomic) NSString* deviceOs;
@property (strong, nonatomic) NSString* osVersion;
@property (strong, nonatomic) NSString* appver;
@property (strong, nonatomic) NSString* appid;
@property (strong, nonatomic) NSString* env;
@property (strong, nonatomic) NSNumber* memberId;
@end

#pragma mark --更多应用数据模型  测试数据
@interface MOREAPP_INFO : NSObject
@property (strong, nonatomic) NSString* icon;
@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* version;
@property (strong, nonatomic) NSString* content;
@end

#pragma mark -- 海报信息
@interface POSTERS_INOF : NSObject

@property (strong, nonatomic) NSString* content;
@property (strong, nonatomic) NSString* posterCover;
@property (strong, nonatomic) NSNumber* id;
@property (strong, nonatomic) NSString* posterTitle;
@property (strong, nonatomic) NSString* posterType;
@property (strong, nonatomic) NSString* posterPosition;
@property (strong, nonatomic) NSString* url;
@property (strong, nonatomic) NSNumber* viewCount;

@end

#pragma mark -- 好友组
@interface BUDDY_GROUP : NSObject

@property(nonatomic, strong) NSString* name; //班级名称
@property(nonatomic, strong) NSArray* friends; //班级成员列表

@end

#pragma mark -- 好友信息
@interface BUDDY_INFO : NSObject

@property(nonatomic, strong) NSString* realName;
@property(nonatomic, strong) NSNumber* id;
@property(nonatomic, strong) NSString* iconPhoto; //具体的好友
@property(nonatomic, strong) NSString* mobile;
@property(nonatomic, strong) NSString* identity;

@end


#pragma mark 联系人列表
@interface LOCAL_CONTACTS : BeeActiveRecord
@property (nonatomic, strong) NSNumber* userId; //用户的唯一标识
@property(nonatomic, strong) NSString* realName;//账号名
@property(nonatomic, strong) NSString* iconPhoto; //具体的好友
@property(nonatomic, strong) NSString* mobile;//对应环信账号
@property(nonatomic, strong) NSString* identity;//描述
@end

#pragma mark 收通知人信息
@interface RECIPIENT_INFO : NSObject

@property(nonatomic, strong) NSString* realName;
@property(nonatomic, strong) NSNumber* id;

@end

#pragma mark 发送通知参数
@interface SEND_NOTIFY : NSObject

@property(nonatomic, strong) NSString* messageCategory;
@property(nonatomic, strong) NSString* subjectbody;
@property(nonatomic, strong) NSString* body;
@property(nonatomic, strong) NSNumber* senderId;
@property(nonatomic, strong) NSArray* receiverIds;
@end

#pragma mark 自动登录
@interface AUTOLOGIN_FLAG : NSObject
@property(strong, nonatomic) NSString* flag;
@end

#pragma mark 角标个数
@interface BADGE_NUM : NSObject
@property(strong, nonatomic) NSNumber* notifyUnRead;
@property(strong, nonatomic) NSNumber* chatUnRead;
@end

#pragma mark 精品课程
@interface COURSE_PHOTOS : NSObject
@property (strong, nonatomic) NSNumber* id;
@property (strong, nonatomic) NSString* description;
@property (strong, nonatomic) NSArray* qualityCourseImageAttachs;
@end

