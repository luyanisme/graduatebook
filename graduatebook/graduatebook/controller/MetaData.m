//
//  MetaData.m
//  moshop
//
//  Created by wangkai on 4/8/15.
//  Copyright (c) 2015 sencloudx. All rights reserved.
//

#import "MetaData.h"


@implementation SCHOOL_FUNCTION

@synthesize id = _id;
@synthesize functionImage = _functionImage;
@synthesize functionName = _functionName;

@end

@implementation CHILD_INFO
@synthesize name = _name;
@synthesize studentName = _studentName;
@synthesize studentNo = _studentNo;
@synthesize dictClassId = _dictClassId;
@synthesize cardNumber = _cardNumber;

@end

@implementation DEVICE_INFO

@synthesize isoCountryCode = _isoCountryCode;
@synthesize carrierName = _carrierName;
@synthesize mobileCountryCode = _mobileCountryCode;
@synthesize deviceName = _deviceName;
@synthesize deviceModel = _deviceModel;
@synthesize uuid = _uuid;
@synthesize osName = _osName;
@synthesize deviceOs = _deviceOs;
@synthesize osVersion = _osVersion;
@synthesize userName = _userName;
@synthesize macAddress = _macAddress;
@synthesize localLanguage = _localLanguage;
@synthesize appver = _appver;
@synthesize appid = _appid;
@synthesize env = _env;
@synthesize deviceToken = _deviceToken;
@synthesize altitude = _altitude;
@synthesize speed = _speed;
@synthesize longitude = _longitude;
@synthesize timezone = _timezone;
@synthesize latitude = _latitude;
@synthesize accuracy = _accuracy;
@synthesize timestamp = _timestamp;
@synthesize heading = _heading;
@synthesize altitudeAccuracy = _altitudeAccuracy;

@end

@implementation USER_INFO

@synthesize dictSchool = _dictSchool;
@synthesize dictSchoolId = _dictSchoolId;
@synthesize memberId = _memberId;
@synthesize memberType = _memberType;
@synthesize realName = _realName;
@synthesize schoolLogo = _schoolLogo;
@synthesize schoolName = _schoolName;
@synthesize bgColor = _bgColor;
@synthesize iconPhoto = _iconPhoto;
CONVERT_PROPERTY_CLASS(studentInfos, CHILD_INFO)
@end

@implementation CLASS_INFO

@synthesize cmaster = _cmaster;
@synthesize id = _id;
@synthesize description = _description;
@synthesize name = _name;
@synthesize isSelected = _isSelected;
@end

@implementation PRESENCE_REQUEST

@synthesize date = _date;
@synthesize studentNo = _studentNo;
@synthesize memberType = _memberType;
@synthesize dictClassId = _dictClassId;
@synthesize memberId = _memberId;

@end

@implementation PRESENCE_RECORD
@synthesize enterDate = _enterDate;
@synthesize leaveDate = _leaveDate;
@synthesize status = _status;
@synthesize statusName = _statusName;
@synthesize studentName = _studentName;
@synthesize iconPhoto = _iconPhoto;
@synthesize attendanceDate = _attendanceDate;
@end

@implementation MEALS_REQUEST

@synthesize year = _year;
@synthesize month = _month;
@synthesize week = _week;

@end

@implementation MEALS_TIME

@synthesize id = _id;
@synthesize week = _week;
@synthesize month = _month;
@synthesize year = _year;
@synthesize createDate = _createDate;
@synthesize isCurrent = _isCurrent;

@end

@implementation MEALS_ALL

@synthesize weekStartDate = _weekStartDate;
@synthesize weekEndDate = _weekEndDate;
@synthesize week = _week;
CONVERT_PROPERTY_CLASS(recipeWeekDays, MEALS_WEEK)

@end

@implementation MEALS_WEEK

@synthesize id = _id;
@synthesize weekDay = _weekDay;
CONVERT_PROPERTY_CLASS(recipeSections, MEALS_INFO)

@end

@implementation MEALS_INFO

@synthesize sectionName = _sectionName;
@synthesize id = _id;
@synthesize description = _description;
CONVERT_PROPERTY_CLASS(recipeImages, MEALS_ITEM)
@end

@implementation MEALS_ITEM

@synthesize id = _id;
@synthesize dishImage = _dishImage;

@end

@implementation SEMESTER_INFO

@synthesize id = _id;
@synthesize startYear = _startYear;
@synthesize endYear = _endYear;
@synthesize term = _term;
@synthesize isCurrent = _isCurrent;

@end

@implementation COURSE_INFO

@synthesize id = _id;
@synthesize endTime = _endTime;
@synthesize week = _week;
@synthesize lessons = _lessons;
@synthesize classRoom = _classRoom;
@synthesize startTime = _startTime;
@synthesize courseName = _courseName;

@end


@implementation CITY_INFO

@synthesize id = _id;
@synthesize name = _name;
CONVERT_PROPERTY_CLASS(citys, REGION_INFO)
@end

@implementation REGION_INFO

@synthesize id = _id;
@synthesize name = _name;

@end

@implementation PROVINCE_INFO

@synthesize id = _id;
@synthesize name = _name;

@end

@implementation BABY_DETAIL

@synthesize gender = _gender;
@synthesize studentId = _studentId;
@synthesize studnetNo = _studnetNo;
@synthesize birthday = _birthday;
@synthesize studentName = _studentName;
@synthesize genderName = _genderName;
@synthesize iconPhoto = _iconPhoto;
@synthesize type = _type;
@synthesize typeName = _typeName;


@end


@implementation PERSONAL_SETTING

@synthesize mobile = _mobile;
@synthesize city = _city;
@synthesize realName = _realName;
@synthesize region = _region;
@synthesize province = _province;
@synthesize iconPhoto = _iconPhoto;
CONVERT_PROPERTY_CLASS(dictStudents, BABY_DETAIL)

@end

@implementation PROVINCE_LIST

@synthesize id = _id;
@synthesize name = _name;
CONVERT_PROPERTY_CLASS(citys, CITY_INFO)

@end

@implementation MODIFY_USERINOF

@synthesize memberId = _memberId;
@synthesize realName = _realName;
@synthesize areaId = _areaId;
@synthesize mobile = _mobile;
@synthesize oldPassword = _oldPassword;
@synthesize password = _password;
@synthesize type = _type;
@synthesize iconPhoto = _iconPhoto;

@end

@implementation MODIFY_BABYINFO

@synthesize studentId = _studentId;
@synthesize studentName = _studentName;
@synthesize gender = _gender;
@synthesize birthday = _birthday;
@synthesize type = _type;
@synthesize modifyType = _modifyType;
@synthesize memberId = _memberId;
@synthesize iconPhoto = _iconPhoto;

@end

@implementation IDENTIFY_INFO

@synthesize typeName = _typeName;
@synthesize type = _type;

@end

@implementation NEWS_CATEGORY

@synthesize id = _id;
@synthesize categoryName = _categoryName;
@synthesize isSelected = _iisSelected;

- (id)init{
    self = [super init];
    if (self) {
        self.isSelected = NO;
    }
    return self;
}

@end

@implementation NEWS_SUMMARY

@synthesize id = _id;
@synthesize summary = _summary;
@synthesize smallIconfile = _smallIconfile;
@synthesize title = _title;

@end

@implementation NEWS_CONTENT

@synthesize summary = _summary;
@synthesize content = _content;
@synthesize author = _author;
@synthesize title = _title;
@synthesize viewCount = _viewCount;
@synthesize source = _source;
@synthesize detailUrl = _detailUrl;
@synthesize smallIconfile = _smallIconfile;
@synthesize timePublish = _timePublish;

@end


@implementation ANNOUNCE_CONTENT

@synthesize summary = _summary;
@synthesize content = _content;
@synthesize author = _author;
@synthesize source = _source;
@synthesize timePublish = _timePublish;
@synthesize title = _title;
@synthesize viewCount = _viewCount;

@end

@implementation SCHOOL_INTRODUCE

@synthesize introduction = _introduction;
@synthesize schoolBadge = _schoolBadge;
@synthesize schoolMotto = _schoolMotto;
@synthesize schoolSong = _schoolSong;
@synthesize indexImage = _indexImage;

@end

@implementation ANNOUNCE_SUMMARY

@synthesize id = _id;
@synthesize summary = _summary;
@synthesize title = _title;
@synthesize smallIconfile = _smallIconfile;

@end

@implementation VERIFICATION_INOF

@synthesize safeKey = _safeKey;
@synthesize validateCode = _validateCode;
@synthesize phoneNumber = _phoneNumber;

@end

@implementation ALBUMS_INFO

@synthesize longitude = _longitude;
@synthesize id = _id;
@synthesize lastUpdateTime = _lastUpdateTime;
@synthesize locationName = _locationName;
@synthesize latitude = _latitude;
@synthesize description = _description;
@synthesize viewCount = _viewCount;
@synthesize favoriteCount = _favoriteCount;
@synthesize coverImage = _coverImage;
@synthesize lastUpdator = _lastUpdator;
CONVERT_PROPERTY_CLASS(campusviewImageAttachs, ALBUM_IMAGE)

@end

@implementation ALBUM_IMAGE

@synthesize imageAttach = _imageAttach;
@synthesize id = _id;

@end

@implementation ADD_PRESENCE

@synthesize device = _device;
@synthesize systemInfo = _systemInfo;
@synthesize cardNumber = _cardNumber;

@end

@implementation ACCOUNT_INFO

@synthesize name = _name;
@synthesize info = _info;
@synthesize accountId = _accountId;

@end
@implementation HELP_INFO
@synthesize question = _question;
@synthesize content = _content;
@synthesize helpId = _helpId;

@end

@implementation NOTIFICATION_REQ

//@synthesize msgCategory = _msgCategory;
@synthesize type = _type;

@end

@implementation NOTIFICATION_INFO

@synthesize id = _id;
@synthesize realName = _realName;
@synthesize body = _body;
@synthesize subject = _subject;
@synthesize createDate = _createDate;
@synthesize adjust = _adjust;
@synthesize iconPhoto = _iconPhoto;
@synthesize receiverRead = _receiverRead;
@synthesize isExpand = _isExpand;
@synthesize messageCategory = _messageCategory;
@synthesize transferId = _transferId;

- (id)init{
    self = [super init];
    if (self) {
        _isExpand = NO;
        _receiverRead = @(0);
    }
    return self;
}

@end

@implementation PAGINATION

@synthesize pageSize = _pageSize;
@synthesize pageNumber = _pageNumber;

@end

@implementation LEAVE_REQUEST

@synthesize leaveStartDate = _leaveStartDate;
@synthesize leaveEndDate = _leaveEndDate;
@synthesize memberId = _memberId;
@synthesize stuNo = _stuNo;
@synthesize description = _description;
@synthesize askLeaveType = _askLeaveType;

@end

@implementation LOCAL_ACCOUNT

@synthesize userInfo = _userInfo;
@synthesize memberType = _memberType;
@synthesize accountNum = _accountNum;
@synthesize password = _password;
@synthesize isSelect = _isSelect;
@synthesize iconPhoto = _iconPhoto;
@synthesize realName = _realName;
@synthesize memberId = _memberId;
+ (NSString *)activePrimaryKeyFor:(Class)clazz
{
    NSString *key = nil;
    if ( nil == key )
    {
        key = @"memberId";
    }
    
    return key;
}
@end

@implementation COURSE_DETAIL

@synthesize friday = _friday;
@synthesize fridayDesc = _fridayDesc;
@synthesize fridayImage = _fridayImage;
@synthesize thursday = _thursday;
@synthesize thursdayDesc = _thursdayDesc;
@synthesize thursdayImage = _thursdayImage;
@synthesize tuesday = _tuesday;
@synthesize tuesdayDesc = _tuesdayDesc;
@synthesize tuesdayImage = _tuesdayImage;
@synthesize wednesday = _wednesday;
@synthesize wednesdayDesc = _wednesdayDesc;
@synthesize wednesdayImage = _wednesdayImage;
@synthesize monday = _monday;
@synthesize mondayDesc = _mondayDesc;
@synthesize mondayImage = _mondayImage;
@synthesize planSection = _planSection;

@end

@implementation COURSE_WEEKPLAN

@synthesize weekStartDate = _weekStartDate;
@synthesize id = _id;
@synthesize week = _week;
@synthesize weekEndDate = _weekEndDate;
@synthesize weekSubject = _weekSubject;
@synthesize isCurrent = _isCurrent;

@end

@implementation NOTIFICATION_SETTING

@synthesize playSound = _playSound;
@synthesize playVibration = _playVibration;
@synthesize dataName = _dataName;
@synthesize receiveNotify = _receiveNotify;
+ (NSString *)activePrimaryKeyFor:(Class)clazz
{
    NSString *key = nil;
    if ( nil == key )
    {
        key = @"dataName";
    }
    
    return key;
}

- (id)init{
    self = [super init];
    if (self) {
        self.receiveNotify = @(1);
    }
    return self;
}

@end

@implementation FEEDBACK_INFO

@synthesize suggestContent = _suggestContent;
@synthesize suggestDate = _suggestDate;
@synthesize deviceModel = _deviceModel;
@synthesize uuid = _uuid;
@synthesize osName = _osName;
@synthesize deviceOs = _deviceOs;
@synthesize osVersion = _osVersion;
@synthesize appver = _appver;
@synthesize appid = _appid;
@synthesize env = _env;
@synthesize memberId = _memberId;

@end


@implementation MOREAPP_INFO

@synthesize icon = _icon;
@synthesize title = _title;
@synthesize version = _version;
@synthesize content = _content;

@end
@implementation POSTERS_INOF

@synthesize content = _content;
@synthesize posterCover = _posterCover;
@synthesize id = _id;
@synthesize posterTitle = _posterTitle;
@synthesize posterType = _posterType;
@synthesize posterPosition = _posterPosition;
@synthesize url = _url;
@synthesize viewCount = _viewCount;

@end

@implementation BUDDY_GROUP

@synthesize name = _name;
CONVERT_PROPERTY_CLASS(friends, BUDDY_INFO)

@end

@implementation BUDDY_INFO

@synthesize realName = _realName;
@synthesize id = _id;
@synthesize iconPhoto = _iconPhoto;
@synthesize mobile = _mobile;
@synthesize identity = _identity;

@end


@implementation LOCAL_CONTACTS

@synthesize userId = _userId;
@synthesize realName = _realName;
@synthesize mobile = _mobile;
@synthesize iconPhoto = _iconPhoto;
@synthesize identity = _identity;
+ (NSString *)activePrimaryKeyFor:(Class)clazz
{
    NSString *key = nil;
    if ( nil == key )
    {
        key = @"userId";
    }
    
    return key;
}
@end

@implementation RECIPIENT_INFO

@synthesize realName = _realName;
@synthesize id = _id;

@end

@implementation SEND_NOTIFY

@synthesize messageCategory = _messageCategory;
@synthesize subjectbody = _subjectbody;
@synthesize body = _body;
@synthesize senderId = _senderId;
@synthesize receiverIds = _receiverIds;

@end

@implementation AUTOLOGIN_FLAG

@synthesize flag = _flag;

@end

@implementation BADGE_NUM

@synthesize notifyUnRead = _notifyUnRead;
@synthesize chatUnRead =_chatUnRead;

@end

@implementation COURSE_PHOTOS

@synthesize id = _id;
@synthesize description = _description;
@synthesize qualityCourseImageAttachs = _qualityCourseImageAttachs;

CONVERT_PROPERTY_CLASS(qualityCourseImageAttachs, ALBUM_IMAGE)
@end