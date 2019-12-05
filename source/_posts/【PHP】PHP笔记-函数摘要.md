layout: layout
title: 【PHP】PHP笔记-函数摘要
author: 吴楚衡
tags:
  - php
categories:
  - php
date: 2019-10-28 23:27:44
---
#### 1 json__decode() 格式化输出

``` shell
   $json = '"{"status":"1","count":"1","info":"OK","infocode":"10000","lives":[{"province":"\u5e7f\u4e1c","city":"\u6df1\u5733\u5e02","adcode":"440300","weather":"\u6674","temperature":"20","winddire                                                                                                 ction":"\u897f\u5317","windpower":"\u22643","humidity":"74","reporttime":"2019-10-28 23:15:45}]}"';
   json_encode($json, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT); 
```
{% note info %}
    加了参数`JSON_PRETTY_PRINT`和`JSON_UNESCAPED_UNICODE`后会格式化，在命令行打印就没那么乱了
{% endnote %}
<!--more-->

#### 计算坐标距离

``` php 
	/**
 * 计算两点地理坐标之间的距离
 * @param  Decimal $longitude1 起点经度
 * @param  Decimal $latitude1  起点纬度
 * @param  Decimal $longitude2 终点经度 
 * @param  Decimal $latitude2  终点纬度
 * @param  Int     $unit       单位 1:米 2:公里
 * @param  Int     $decimal    精度 保留小数位数
 * @return Decimal
 */
function getDistance($longitude1, $latitude1, $longitude2, $latitude2, $unit=2, $decimal=2){

    $EARTH_RADIUS = 6370.996; // 地球半径系数
    $PI = 3.1415926;

    $radLat1 = $latitude1 * $PI / 180.0;
    $radLat2 = $latitude2 * $PI / 180.0;

    $radLng1 = $longitude1 * $PI / 180.0;
    $radLng2 = $longitude2 * $PI /180.0;

    $a = $radLat1 - $radLat2;
    $b = $radLng1 - $radLng2;

    $distance = 2 * asin(sqrt(pow(sin($a/2),2) + cos($radLat1) * cos($radLat2) * pow(sin($b/2),2)));
    $distance = $distance * $EARTH_RADIUS * 1000;

    if($unit==2){
        $distance = $distance / 1000;
    }

    return round($distance, $decimal);

}

```

* 注： [摘录自](https://blog.csdn.net/fdipzone/article/details/47162563)

#### 计算坐标附近坐标

``` php 
// 注： 使用的是laravel 的DB数据库驱动
use Illuminate\Support\Facades\DB; 

/**
 *计算某个经纬度的周围某段距离的正方形的四个点
 *@param lng float 经度
 *@param lat float 纬度
 *@param distance float 该点所在圆的半径，该圆与此正方形内切，默认值为0.5千米
 *@return array 正方形的四个点的经纬度坐标
 */
function get_square_point($lng, $lat,$distance = 0.5)
{
    $earth_radius =  6371;//地球半径，平均半径为6371km
    $dlng =  2 * asin(sin($distance / (2 * $earth_radius)) / cos(deg2rad($lat)));
    $dlng = rad2deg($dlng);
    $dlat = $distance/$earth_radius;
    $dlat = rad2deg($dlat);
    $squares= array(
        'left-top'     => array('latitude'=>$lat + $dlat, 'longitude'=>$lng-$dlng),
        'right-top'    => array('latitude'=>$lat + $dlat, 'longitude'=>$lng + $dlng),
        'left-bottom'  => array('latitude'=>$lat - $dlat, 'longitude'=>$lng - $dlng),
        'right-bottom' => array('latitude'=>$lat - $dlat, 'longitude'=>$lng + $dlng)
    );
    $info_sql = "
        select
        *
        from
        `admin_users`
        where
        latitude<>0
        and
        latitude>{$squares['right-bottom']['latitude']}
        and
        latitude<{$squares['left-top']['latitude']}
        and
        longitude>{$squares['left-top']['longitude']}
        and
        longitude<{$squares['right-bottom']['longitude']}
        ";
    $locations = DB::select($info_sql);
    return $locations;
}

``` 
##### sql 数据
``` SQL
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `province_id` int(11) NULL DEFAULT NULL COMMENT '省id',
  `city_id` int(11) NULL DEFAULT NULL COMMENT '市id',
  `district_id` int(11) NULL DEFAULT NULL COMMENT '区id',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机',
  `address_tag_ids` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址标签组',
  `longitude` float NULL DEFAULT NULL COMMENT '经度',
  `latitude` float NULL DEFAULT NULL COMMENT '纬度',
  `rate` float NULL DEFAULT 0 COMMENT '评分',
  `thumbs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '默认图片',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_users_username_unique`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES (1, 'admin', '$2y$10$mCD6sALAyA1n1TA1kmHPde4q.HyBIxP6s.hyixuUn5pEcAOq8PNly', 'Administrator', NULL, 'ARHYDKYuNtYo6YPux1w8XK7Ewnr1SnmKOppn8RKv9OqTrpsVFpN2Fvq8dSd5', '2019-11-17 17:43:24', '2019-11-17 17:43:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `admin_users` VALUES (2, 'test_store_1', '$2y$10$ymeySpuUSuA9Sw6m5LJu/eUwi5OS/pUAYLsfxNRG24yDh2bHm1jUm', '测试门店11', NULL, 'Q22MIny2R4OkCi1NJdlcxIcBjhbO1pELUvjWUr9GS1uU5md2VvNxlj6epnbu', '2019-11-19 03:12:16', '2019-11-30 08:32:54', 440000, 440100, 440113, '修改为广州的地址', '13427969604', '1', 113.27, 22.9884, 1, '[\"images\\/5459830341e51c0f9ffafbde26aa92e7.png\",\"images\\/dbbb7afd9541413b858b37bc1f58d456.png\",\"images\\/14.jpg\"]');
INSERT INTO `admin_users` VALUES (28, 'address_atg_ids', '$2y$10$IZUGkGor7p4NsK58oaRknuOqjClTWOHKHo4NKsInerGXM14Xsy8KS', '测试门店21', NULL, NULL, '2019-11-26 08:57:18', '2019-11-29 21:07:55', 440000, 445200, 445224, '测试门店2的地址', '13427969604', '1', 116.295, 23.0232, 2, '[\"images\\/5459830341e51c0f9ffafbde26aa92e7.png\",\"images\\/dbbb7afd9541413b858b37bc1f58d456.png\",\"images\\/14.jpg\"]');
INSERT INTO `admin_users` VALUES (29, 'test_store_3', '$2y$10$yVygcYHu443y1JSipdDXcenTXksGga9b4edZPrcrOuD3F0NUBeC3S', '测试门店3', NULL, NULL, '2019-11-29 18:39:26', '2019-11-29 20:56:52', 440000, 441300, 441303, '测试门店3的地址', '13427969604', '2', 114.455, 22.783, 4, '[\"images\\/cefb1285dc1ec23b9c62936795c27dc7.jpg\",\"images\\/f1de376cdb5338c9f0ea6306cbdcf5c2.jpg\",\"images\\/4193b3654284031c0e13db01633098da.jpg\"]');
INSERT INTO `admin_users` VALUES (30, 'test_store_5', '$2y$10$GGwmtj.ZzsAh8JcgZXS.xe0OEy.EkU7DymNc9hRjuRPTMrFwZSDCm', '测试门店5', NULL, NULL, '2019-12-04 15:55:29', '2019-12-04 15:55:29', 440000, 441300, 441323, '测试门店5的地址是在惠东县那边的', '13427969600', '1', 114.72, 22.985, 5, '[\"images\\/5459830341e51c0f9ffafbde26aa92e7.png\",\"images\\/dbbb7afd9541413b858b37bc1f58d456.png\",\"images\\/14.jpg\"]');
INSERT INTO `admin_users` VALUES (31, 'test_store_6', '$2y$10$K2gWPsa8wk36wl8ybcHx0OpbR6n8pvdGPLE5.lasMrz7ODRcfJd7a', '惠东县测试门店6', NULL, NULL, '2019-12-04 15:57:25', '2019-12-04 15:57:25', 440000, 441300, 441323, '惠东县测试门店6的地址哈', '13427969600', '2', 114.72, 22.9718, 4, '[\"images\\/5459830341e51c0f9ffafbde26aa92e7.png\",\"images\\/dbbb7afd9541413b858b37bc1f58d456.png\",\"images\\/14.jpg\"]');
INSERT INTO `admin_users` VALUES (32, 'test_store_7', '$2y$10$g2yZhgf9KtV0MnPJbOWbIue9/EmABzXJKmcd/eeDYvQxtA9h2CwZu', '测试门店7', NULL, NULL, '2019-12-05 09:54:46', '2019-12-05 09:54:46', 440000, 441300, 441303, '皇家公馆（测试地址第一近）', '13427969604', '2', 114.456, 22.7834, 5, '[\"images\\/5459830341e51c0f9ffafbde26aa92e7.png\",\"images\\/dbbb7afd9541413b858b37bc1f58d456.png\",\"images\\/14.jpg\"]');
INSERT INTO `admin_users` VALUES (33, 'test_store_8', '$2y$10$4zCp3eYVI5EpoCa89AbyEu90ES7aLjiFOJNm/iUZd.MTINFM2wxsi', '测试门店8', NULL, NULL, '2019-12-05 09:55:49', '2019-12-05 09:55:49', 440000, 441300, 441303, '测试地址第二近', '13427969604', '1', 114.456, 22.7832, 4, '[\"images\\/5459830341e51c0f9ffafbde26aa92e7.png\",\"images\\/dbbb7afd9541413b858b37bc1f58d456.png\",\"images\\/14.jpg\"]');
INSERT INTO `admin_users` VALUES (34, 'test_store_9', '$2y$10$3lWrP8K/mTNtso03V.ef0.unebThRU1.gToQkO/hMIeftPbZlCMNi', '测试门店9', NULL, NULL, '2019-12-05 09:56:39', '2019-12-05 09:56:39', 440000, 441300, 441303, '测试地址第3近', '13427969600', '2', 114.457, 22.7836, 4, '[\"images\\/5459830341e51c0f9ffafbde26aa92e7.png\",\"images\\/dbbb7afd9541413b858b37bc1f58d456.png\",\"images\\/14.jpg\"]');

SET FOREIGN_KEY_CHECKS = 1;
```
```