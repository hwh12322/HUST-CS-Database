use MyDb;
alter table addressBook 
    modify QQ char(12),
    rename column weixin to wechat;
