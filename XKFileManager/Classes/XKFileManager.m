//
//  XKFileManager.m
//  XKFileManager
//
//  Created by ALLen、 LAS on 2019/8/1.
//  Copyright © 2019 ALLen、 LAS. All rights reserved.
//

#import "XKFileManager.h"

static NSFileManager *_fileManager;
@implementation XKFileManager

+ (void)initialize{
    _fileManager = [NSFileManager defaultManager];
}

//获取沙盒主目录路径
+ (NSString *)homeDirectory{
    return NSHomeDirectory();
}

//获取Library目录
+ (NSString *)libraryDirectory{
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
}

//获取Caches目录路径
+ (NSString *)cachesDirectory{
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
}

//获取document目录路径
+ (NSString*)documentDirectory{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

//获取temporary目录路径
+ (NSString*)temporaryDirectory{
    return NSTemporaryDirectory();
}

//获取NSBundle文件资源路径
+ (NSString *)pathForResource:(NSString *)name ofType:(NSString *)ext{
    return [[NSBundle mainBundle] pathForResource:name ofType:ext];
}

//获取沙盒主目录路径NSHomeDirectory()下 某文件目录路径
+ (NSString*)homeDirectoryByAppendingPathComponent:(NSString*)fileName{
    return [[self homeDirectory] stringByAppendingPathComponent:fileName];
}

//获取Library目录路径 NSLibraryDirectory[0]，某文件目录路径
+ (NSString*)libraryDirectoryByAppendingPathComponent:(NSString*)fileName{
    return [[self libraryDirectory] stringByAppendingPathComponent:fileName];
}

//获取Caches目录路径 NSCachesDirectory[0]，某文件目录路径
+ (NSString*)cachesDirectoryByAppendingPathComponent:(NSString*)fileName{
    return [[self cachesDirectory] stringByAppendingPathComponent:fileName];
}

//获取Document目录路径 NSDocumentDirectory[0]，某文件目录路径
+ (NSString*)documentDirectoryByAppendingPathComponent:(NSString*)fileName{
    return [[self documentDirectory] stringByAppendingPathComponent:fileName];
}

//获取temp 目录路径  NSTemporaryDirectory(),某文件目录路径
+ (NSString*)temporaryDirectoryByAppendingPathComponent:(NSString*)fileName{
    return [[self temporaryDirectory] stringByAppendingPathComponent:fileName];
}

#pragma mark - fm操作

//判断路径是否存在
+ (BOOL)fileExistsAtPath:(NSString*)path{
    if (!path.length) return NO;
    return [_fileManager fileExistsAtPath:path];
}

//获取某路径下的所有子路径名
+ (nullable NSArray<NSString *> *)subpathsAtPath:(NSString*)path{
    if ([self fileExistsAtPath:path]) {
        return [_fileManager subpathsAtPath:path];
    }
    return nil;
}

// 获取文件路径下的二进制数据
+ (nullable NSData*)contentsAtPath:(NSString*)path{
    if ([self fileExistsAtPath:path]) {
        return [_fileManager contentsAtPath:path];
    }
    return nil;
}

//创建文件目录
+ (BOOL)createDirectoryAtPath:(NSString*)path{
    if (![_fileManager fileExistsAtPath:path]) {
        return [_fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return YES;
}

//重命名或者移动一个文件（to不能是已存在的）
+ (BOOL)moveItemAtPath:(NSString*)srcPath toPath:(NSString *)dstPath{
    if (srcPath.length && dstPath.length) {
        if (![_fileManager fileExistsAtPath:srcPath]) {
            return NO;
        }
        return [_fileManager moveItemAtPath:srcPath toPath:dstPath error:nil];
    }
    return NO;
}

//重命名或者复制一个文件（to不能是已存在的）
+ (BOOL)copyItemAtPath:(NSString*)srcPath toPath:(NSString *)dstPath{
    if (srcPath.length && dstPath.length) {
        if (![_fileManager fileExistsAtPath:srcPath]) {
            return NO;
        }
        return [_fileManager copyItemAtPath:srcPath toPath:dstPath error:nil];
    }
    return NO;
}

//删除文件
+ (BOOL)removeItemAtPath:(NSString*)path{
    if ([_fileManager fileExistsAtPath:path]) {
        return [_fileManager removeItemAtPath:path error:nil];
    }
    return NO;
}

#pragma mark - NSUserDefaults -

//取值NSUserDefaults
+ (id)handleUserDefaultsObjectForKey:(NSString *)key{
    if (key.length) {
        return [[NSUserDefaults standardUserDefaults] objectForKey:key];
    }
    return nil;
}

//存值NSUserDefaults
+ (void)handleUserDefaultsSetObject:(id)Object forKey:(NSString *)key{
    if (key.length) {
        [[NSUserDefaults standardUserDefaults] setObject:Object forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

//删值 NSUserDefaults
+ (void)handleUserDefaultsRemoveObjectForKey:(NSString *)key{
    if (key.length) {
        return [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    }
}
@end
