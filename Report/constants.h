//
//  constants.h
//  Report
//
//  Created by Lyndon Michael Bibera on 7/16/14.
//  Copyright (c) 2014 Secret Transaction Inc. All rights reserved.
//

#ifndef Report_constants_h
#define Report_constants_h

//entity names
static NSString *const EntityReport = @"Report";

//segues Segue<VCName>
static NSString *const SegueReport = @"EditReportSegue";
static NSString *const SegueEditArticle = @"ReportToArticleSegue";
static NSString *const SegueEditImages = @"ReportToImagesSegue";

//unwind segues UnwindSegue<VCName>
static NSString *const UnwindSegueReportTable = @"unwindToReportTableVC";
static NSString *const UnwindSegueReport = @"done";

#endif
