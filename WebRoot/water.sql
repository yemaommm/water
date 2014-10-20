-- ----------------------------
-- View structure for current_day_area_param
-- ----------------------------
DROP VIEW IF EXISTS `current_day_area_param`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `current_day_area_param` AS select date_format(`A`.`send_time`,'%y-%m-%d') AS `status_day`,round(avg(`A`.`ph`),2) AS `ph`,round(avg(`A`.`turbidity`),2) AS `turbidity`,round(avg(`A`.`rc`),2) AS `rc`,round(avg(`A`.`d_oxygen`),2) AS `d_oxygen`,round(avg(`A`.`conductivity`),2) AS `conductivity`,round(avg(`A`.`orp`),2) AS `orp` 
,`D`.`area_id` AS id from `hardsocket_water_param` `A` 
inner join `device_device` `D` on (`A`.`device_id` = `D`.`device_id`)
where `A`.`send_time` = (select max(send_time) 
from `hardsocket_water_param`  where `D`.`device_id`=`device_id`)
group by `D`.`area_id`,`A`.`send_time` ;

-- ----------------------------
-- View structure for current_day_corp_param
-- ----------------------------
DROP VIEW IF EXISTS `current_day_corp_param`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `current_day_corp_param` AS select date_format(`A`.`send_time`,'%y-%m-%d') AS `status_day`,round(avg(`A`.`ph`),2) AS `ph`,round(avg(`A`.`turbidity`),2) AS `turbidity`,round(avg(`A`.`rc`),2) AS `rc`,round(avg(`A`.`d_oxygen`),2) AS `d_oxygen`,round(avg(`A`.`conductivity`),2) AS `conductivity`,round(avg(`A`.`orp`),2) AS `orp`,`B`.`corp_id` as 'id' 
from `hardsocket_water_param` `A` 
inner join `device_device` `B` on (`A`.`device_id` = `B`.`id`) 
where `A`.`send_time`=(select max(send_time) from hardsocket_water_param where device_id=`B`.device_id)
 group by `B`.`corp_id`,`A`.`send_time` ;

-- ----------------------------
-- View structure for current_day_subcorp_param
-- ----------------------------
DROP VIEW IF EXISTS `current_day_subcorp_param`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `current_day_subcorp_param` AS select date_format(`A`.`send_time`,'%y-%m-%d') AS `status_day`,round(avg(`A`.`ph`),2) AS `ph`,round(avg(`A`.`turbidity`),2) AS `turbidity`,round(avg(`A`.`rc`),2) AS `rc`,round(avg(`A`.`d_oxygen`),2) AS `d_oxygen`,round(avg(`A`.`conductivity`),2) AS `conductivity`,round(avg(`A`.`orp`),2) AS `orp`,`C`.`id` AS `id` from ((`hardsocket_water_param` `A` join `device_device` `B`) join `device_watersubcorp` `C`) where ((`A`.`device_id` = `B`.`id`) and (`C`.`id` = `B`.`sub_corp_id`) and date_format(`A`.`send_time`,'%y-%m-%d') = (select max(date_format(`d`.`send_time`,'%y-%m-%d')) from `hardsocket_water_param` `d`)) group by `C`.`sub_corp_name`,date_format(`A`.`send_time`,'%y-%m-%d') ;

-- ----------------------------
-- View structure for current_month_area_param
-- ----------------------------
DROP VIEW IF EXISTS `current_month_area_param`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `current_month_area_param` AS select date_format(`A`.`send_time`,'%y-%m') AS `status_month`,round(avg(`A`.`ph`),2) AS `ph`,round(avg(`A`.`turbidity`),2) AS `turbidity`,round(avg(`A`.`rc`),2) AS `rc`,round(avg(`A`.`d_oxygen`),2) AS `d_oxygen`,round(avg(`A`.`conductivity`),2) AS `conductivity`,round(avg(`A`.`orp`),2) AS `orp`,`C`.`id` AS `id` from ((`hardsocket_water_param` `A` join `device_area` `C`) join `device_street` `D`) where ((`A`.`device_id` = `D`.`device_id`) and (`D`.`area_id` = `C`.`id`) and date_format(`A`.`send_time`,'%y-%m') = (select max(date_format(`d`.`send_time`,'%y-%m')) from `hardsocket_water_param` `d`)) group by `C`.`area_name`,date_format(`A`.`send_time`,'%y-%m') order by `A`.`send_time` ;

-- ----------------------------
-- View structure for current_month_corp_param
-- ----------------------------
DROP VIEW IF EXISTS `current_month_corp_param`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `current_month_corp_param` AS select date_format(`A`.`send_time`,'%y-%m') AS `status_month`,round(avg(`A`.`ph`),2) AS `ph`,round(avg(`A`.`turbidity`),2) AS `turbidity`,round(avg(`A`.`rc`),2) AS `rc`,round(avg(`A`.`d_oxygen`),2) AS `d_oxygen`,round(avg(`A`.`conductivity`),2) AS `conductivity`,round(avg(`A`.`orp`),2) AS `orp`,`C`.`id` AS `id` from ((`hardsocket_water_param` `A` join `device_device` `B`) join `device_watercorp` `C`) where ((`A`.`device_id` = `B`.`id`) and (`C`.`id` = `B`.`corp_id`) and date_format(`A`.`send_time`,'%y-%m') = (select max(date_format(`d`.`send_time`,'%y-%m')) from `hardsocket_water_param` `d`)) group by `C`.`corp_name`,date_format(`A`.`send_time`,'%y-%m') ;

-- ----------------------------
-- View structure for current_month_subcorp_param
-- ----------------------------
DROP VIEW IF EXISTS `current_month_subcorp_param`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `current_month_subcorp_param` AS select date_format(`A`.`send_time`,'%y-%m') AS `status_month`,round(avg(`A`.`ph`),2) AS `ph`,round(avg(`A`.`turbidity`),2) AS `turbidity`,round(avg(`A`.`rc`),2) AS `rc`,round(avg(`A`.`d_oxygen`),2) AS `d_oxygen`,round(avg(`A`.`conductivity`),2) AS `conductivity`,round(avg(`A`.`orp`),2) AS `orp`,`C`.`id` AS `id` from ((`hardsocket_water_param` `A` join `device_device` `B`) join `device_watersubcorp` `C`) where ((`A`.`device_id` = `B`.`id`) and (`C`.`id` = `B`.`sub_corp_id`) and date_format(`A`.`send_time`,'%y-%m') = (select max(date_format(`d`.`send_time`,'%y-%m')) from `hardsocket_water_param` `d`)) group by `C`.`sub_corp_name`,date_format(`A`.`send_time`,'%y-%m') ;

-- ----------------------------
-- View structure for current_week_area_param
-- ----------------------------
DROP VIEW IF EXISTS `current_week_area_param`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `current_week_area_param` AS select date_format(`A`.`send_time`,'%u') AS `status_week`,round(avg(`A`.`ph`),2) AS `ph`,round(avg(`A`.`turbidity`),2) AS `turbidity`,round(avg(`A`.`rc`),2) AS `rc`,round(avg(`A`.`d_oxygen`),2) AS `d_oxygen`,round(avg(`A`.`conductivity`),2) AS `conductivity`,round(avg(`A`.`orp`),2) AS `orp`,`C`.`id` AS `id` from ((`hardsocket_water_param` `A` join `device_area` `C`) join `device_street` `D`) where ((`A`.`device_id` = `D`.`device_id`) and (`D`.`area_id` = `C`.`id`) and date_format(`A`.`send_time`,'%u') = (select max(date_format(`d`.`send_time`,'%u')) from `hardsocket_water_param` `d`)) group by `C`.`area_name`,date_format(`A`.`send_time`,'%u') order by `A`.`send_time` ;

-- ----------------------------
-- View structure for current_week_corp_param
-- ----------------------------
DROP VIEW IF EXISTS `current_week_corp_param`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `current_week_corp_param` AS select date_format(`A`.`send_time`,'%u') AS `status_week`,round(avg(`A`.`ph`),2) AS `ph`,round(avg(`A`.`turbidity`),2) AS `turbidity`,round(avg(`A`.`rc`),2) AS `rc`,round(avg(`A`.`d_oxygen`),2) AS `d_oxygen`,round(avg(`A`.`conductivity`),2) AS `conductivity`,round(avg(`A`.`orp`),2) AS `orp`,`C`.`id` AS `id` from ((`hardsocket_water_param` `A` join `device_device` `B`) join `device_watercorp` `C`) where ((`A`.`device_id` = `B`.`id`) and (`C`.`id` = `B`.`corp_id`) and date_format(`A`.`send_time`,'%u') = (select max(date_format(`d`.`send_time`,'%u')) from `hardsocket_water_param` `d`)) group by `C`.`corp_name`,date_format(`A`.`send_time`,'%u') ;

-- ----------------------------
-- View structure for current_week_subcorp_param
-- ----------------------------
DROP VIEW IF EXISTS `current_week_subcorp_param`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `current_week_subcorp_param` AS select date_format(`A`.`send_time`,'%u') AS `status_week`,round(avg(`A`.`ph`),2) AS `ph`,round(avg(`A`.`turbidity`),2) AS `turbidity`,round(avg(`A`.`rc`),2) AS `rc`,round(avg(`A`.`d_oxygen`),2) AS `d_oxygen`,round(avg(`A`.`conductivity`),2) AS `conductivity`,round(avg(`A`.`orp`),2) AS `orp`,`C`.`id` AS `id` from ((`hardsocket_water_param` `A` join `device_device` `B`) join `device_watersubcorp` `C`) where ((`A`.`device_id` = `B`.`id`) and (`C`.`id` = `B`.`sub_corp_id`) and date_format(`A`.`send_time`,'%u') = (select max(date_format(`d`.`send_time`,'%u')) from `hardsocket_water_param` `d`)) group by `C`.`sub_corp_name`,date_format(`A`.`send_time`,'%u') ;

-- ----------------------------
-- View structure for day_area_param
-- ----------------------------
DROP VIEW IF EXISTS `day_area_param`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `day_area_param` AS select `C`.`area_name` AS `area_name`,date_format(`A`.`send_time`,'%y-%m-%d') AS `status_day`,round(avg(`A`.`ph`),2) AS `ph`,round(avg(`A`.`turbidity`),2) AS `turbidity`,round(avg(`A`.`rc`),2) AS `rc`,round(avg(`A`.`d_oxygen`),2) AS `d_oxygen`,round(avg(`A`.`conductivity`),2) AS `conductivity`,round(avg(`A`.`orp`),2) AS `orp` from ((`hardsocket_water_param` `A` join `device_area` `C`) join `device_street` `D`) where ((`A`.`device_id` = `D`.`device_id`) and (`D`.`area_id` = `C`.`id`)) group by `C`.`area_name`,date_format(`A`.`send_time`,'%y-%m-%d') order by `A`.`send_time` ;

-- ----------------------------
-- View structure for day_corp_param
-- ----------------------------
DROP VIEW IF EXISTS `day_corp_param`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `day_corp_param` AS select `C`.`corp_name` AS `corp_name`,date_format(`A`.`send_time`,'%y-%m-%d') AS `status_day`,round(avg(`A`.`ph`),2) AS `ph`,round(avg(`A`.`turbidity`),2) AS `turbidity`,round(avg(`A`.`rc`),2) AS `rc`,round(avg(`A`.`d_oxygen`),2) AS `d_oxygen`,round(avg(`A`.`conductivity`),2) AS `conductivity`,round(avg(`A`.`orp`),2) AS `orp` from ((`hardsocket_water_param` `A` join `device_device` `B`) join `device_watercorp` `C`) where ((`A`.`device_id` = `B`.`id`) and (`C`.`id` = `B`.`corp_id`)) group by `C`.`corp_name`,date_format(`A`.`send_time`,'%y-%m-%d') ;

-- ----------------------------
-- View structure for hour_area_param
-- ----------------------------
DROP VIEW IF EXISTS `hour_area_param`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `hour_area_param` AS select `b`.`area_name` AS `area_name`,date_format(`A`.`send_time`,'%y-%m-%d %h') AS `status_hour`,round(avg(`A`.`ph`),2) AS `ph`,round(avg(`A`.`turbidity`),2) AS `turbidity`,round(avg(`A`.`rc`),2) AS `rc`,round(avg(`A`.`d_oxygen`),2) AS `d_oxygen`,round(avg(`A`.`conductivity`),2) AS `conductivity`,round(avg(`A`.`orp`),2) AS `orp` from ((`hardsocket_water_param` `A` join `device_area` `b`) join `device_street` `c`) where ((`A`.`device_id` = `c`.`device_id`) and (`c`.`area_id` = `b`.`id`)) group by `b`.`area_name`,date_format(`A`.`send_time`,'%y-%m-%d %h') order by `A`.`send_time` ;

-- ----------------------------
-- View structure for hour_corp_param
-- ----------------------------
DROP VIEW IF EXISTS `hour_corp_param`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `hour_corp_param` AS select `b`.`corp_name` AS `corp_name`,date_format(`A`.`send_time`,'%y-%m-%d %h') AS `status_hour`,round(avg(`A`.`ph`),2) AS `ph`,round(avg(`A`.`turbidity`),2) AS `turbidity`,round(avg(`A`.`rc`),2) AS `rc`,round(avg(`A`.`d_oxygen`),2) AS `d_oxygen`,round(avg(`A`.`conductivity`),2) AS `conductivity`,round(avg(`A`.`orp`),2) AS `orp` from ((`hardsocket_water_param` `A` join `device_watercorp` `b`) join `device_device` `c`) where ((`A`.`device_id` = `c`.`id`) and (`c`.`corp_id` = `b`.`id`)) group by `b`.`corp_name`,date_format(`A`.`send_time`,'%y-%m-%d %h') order by date_format(`A`.`send_time`,'%y-%m-%d %h') ;

-- ----------------------------
-- View structure for hour_subcorp_param
-- ----------------------------
DROP VIEW IF EXISTS `hour_subcorp_param`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `hour_subcorp_param` AS select `b`.`sub_corp_name` AS `subcorp_name`,date_format(`A`.`send_time`,'%y-%m-%d %h') AS `status_hour`,round(avg(`A`.`ph`),2) AS `ph`,round(avg(`A`.`turbidity`),2) AS `turbidity`,round(avg(`A`.`rc`),2) AS `rc`,round(avg(`A`.`d_oxygen`),2) AS `d_oxygen`,round(avg(`A`.`conductivity`),2) AS `conductivity`,round(avg(`A`.`orp`),2) AS `orp` from ((`hardsocket_water_param` `A` join `device_watersubcorp` `b`) join `device_device` `c`) where ((`A`.`device_id` = `c`.`id`) and (`c`.`sub_corp_id` = `b`.`id`)) group by `b`.`sub_corp_name`,date_format(`A`.`send_time`,'%y-%m-%d %h') order by `A`.`send_time` ;
