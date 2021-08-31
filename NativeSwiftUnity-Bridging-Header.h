//
//  NativeSwiftUnity-Bridging-Header.h
//  Unity-iOS
//
//  Created by Mahmoud Aziz on 31/08/2021.
//


#import <UnityFramework/NativeCallProxy.h>
#import <mach-o/ldsyms.h>
static const struct mach_header_64 *mhExecHeaderPtr = &_mh_execute_header;

