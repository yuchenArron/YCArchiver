# YCArchiver
Handle model file archive and unarchive more quickly an easier

You just inherit the YCArchiveBaseModel base class when you create the model class

Then the class method is called:

Archive ：  [YCUserInfoModel archiveWithObjc: the userInfo];
Unarchive： YCUserInfoModel *model = [YCUserInfoModel unarchive];
