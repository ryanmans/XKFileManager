//
//  XKFileManager.m
//  XKKit
//
//  Created by RyanMans on 2017/12/11.
//  Copyright © 2017年 chonglou. All rights reserved.
//

#import "XKFileManager.h"

static NSFileManager *_fileManager;

@implementation XKFileManager

+ (void)initialize
{
    //文件管理对象
    _fileManager = [NSFileManager defaultManager];
}

//获取沙盒主目录路径
+ (NSString*)xk_HomeDirectory{
    return NSHomeDirectory();
}

//获取Library目录
+ (NSString*)xk_LibraryDirectory{
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
}

//获取Caches目录路径
+ (NSString*)xk_CachesDirectory{
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
}

//获取document目录路径
+ (NSString*)xk_DocumentDirectory{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

//获取temporary目录路径
+ (NSString*)xk_TemporaryDirectory{
    return NSTemporaryDirectory();
}

//获取NSBundle文件资源路径
+ (NSString*)xk_MainBundleWithResource:(NSString *)resource ofType:(NSString *)type{
    return [[NSBundle mainBundle] pathForResource:resource ofType:type];
}

//获取沙盒主目录路径NSHomeDirectory()下 某文件目录路径
+ (NSString*)xk_AppendingHomeDirectory:(NSString*)fileName{
    return [[self xk_HomeDirectory] stringByAppendingPathComponent:fileName];
}

//获取Library目录路径 NSLibraryDirectory[0]，某文件目录路径
+ (NSString*)xk_AppendingLibraryDirectory:(NSString*)fileName{
    return [[self xk_LibraryDirectory] stringByAppendingPathComponent:fileName];
}

//获取Caches目录路径 NSCachesDirectory[0]，某文件目录路径
+ (NSString*)xk_AppendingCachesDirectory:(NSString*)fileName{
    return [[self xk_CachesDirectory] stringByAppendingPathComponent:fileName];
}

//获取Document目录路径 NSDocumentDirectory[0]，某文件目录路径
+ (NSString*)xk_AppendingDocumentDirectory:(NSString*)fileName{
    return [[self xk_DocumentDirectory] stringByAppendingPathComponent:fileName];
}

//获取temp 目录路径  NSTemporaryDirectory(),某文件目录路径
+ (NSString*)xk_AppendingTemporaryDirectory:(NSString*)fileName{
    return [[self xk_TemporaryDirectory] stringByAppendingPathComponent:fileName];
}

#pragma mark - fm

//获取某路径下的所有子路径名
+ (nullable NSArray<NSString *> *)xk_SubpathsAtPath:(NSString*)path{
    
    if (![self xk_FileExistsAtPath:path]) return nil;

    return [_fileManager subpathsAtPath:path];
}

// 获取文件路径下的二进制数据
+ (nullable NSData*)xk_ContentsAtPath:(NSString*)path{
    
    if (![self xk_FileExistsAtPath:path]) return nil;
    
    return [_fileManager contentsAtPath:path];
}

//判断路径是否存在
+ (BOOL)xk_FileExistsAtPath:(NSString*)path{
    if (!path.length) return NO;
    return [_fileManager fileExistsAtPath:path];
}

//创建文件目录
+ (BOOL)xk_CreateDirectoryAtPath:(NSString*)path{
    
    if ([self xk_FileExistsAtPath:path]) return YES;
    return [_fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
}

//重命名或者移动一个文件（to不能是已存在的）
+ (BOOL)xk_MoveItemAtPath:(NSString*)srcPath toPath:(NSString *)dstPath{
    
    if ((srcPath.length && dstPath.length) == NO) return NO;
    
    if (![self xk_FileExistsAtPath:srcPath]) return NO;
    
    return [_fileManager moveItemAtPath:srcPath toPath:dstPath error:nil];
}

//重命名或者复制一个文件（to不能是已存在的）
+ (BOOL)xk_CopyItemAtPath:(NSString*)srcPath toPath:(NSString *)dstPath{
    
    if ((srcPath.length && dstPath.length) == NO) return NO;
    
    if (![self xk_FileExistsAtPath:srcPath]) return NO;
    
    return [_fileManager copyItemAtPath:srcPath toPath:dstPath error:nil];
}

//删除文件
+ (BOOL)xk_RemoveItemAtPath:(NSString*)path{
    if (![self xk_FileExistsAtPath:path]) return NO;
    return [_fileManager removeItemAtPath:path error:nil];
}

#pragma mark - NSUserDefaults -

//取值NSUserDefaults
+ (id)xk_UserDefaultsObjectForKey:(NSString*)key{
    if (!key.length) return nil;
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

//存值NSUserDefaults
+ (void)xk_UserDefaultsSetObject:(id)Object forKey:(NSString *)key{
    
    if (!key.length) return;
    
    [[NSUserDefaults standardUserDefaults] setObject:Object forKey:key];
}

//删值 NSUserDefaults
+ (void)xk_UserDefaultsRemoveObjectForKey:(NSString *)key{
    
    if (!key.length) return;
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
}
@end
