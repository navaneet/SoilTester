//
//  SoilTesterTests.m
//  SoilTesterTests
//
//  Created by Navaneet Sarma on 01/11/16.
//  Copyright © 2016 Navaneet Sarma. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KneadState.h"
#import "SqueezeIntoBallState.h"
#import "Persistance.h"

@interface SoilTesterTests : XCTestCase

@end

@implementation SoilTesterTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testPersistence {
    // Testing Persistance.
    SqueezeIntoBallState *squeezeState = [SqueezeIntoBallState new];
    KneadState *kneadState = [KneadState new];
    XCTAssertTrue([Persistance persistToState:squeezeState fromState:kneadState],@"Persistance Test Case Failure");
    [Persistance clearAllData];
}

@end
