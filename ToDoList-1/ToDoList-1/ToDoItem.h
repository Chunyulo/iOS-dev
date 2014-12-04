//
//  ToDoItem.h
//  ToDoList-1
//
//  Created by Chunyu on 14-12-4.
//  Copyright (c) 2014年 Chunyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly)NSDate *creationDate;

@end
