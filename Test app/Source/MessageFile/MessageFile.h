 /* -------------------------------------------------------------------------
 HEADER SECTION
*/
LanguageNames=(German=0x407:MSG00407)

/* -------------------------------------------------------------------------
 MESSAGE DEFINITION SECTION
*/
/*
 The message in the LogMessage call is shown in event log.
  LogMessage('Your message goes here', EVENTLOG_SUCCESS, 0, 1);
  LogMessage('Your message goes here', EVENTLOG_INFORMATION_TYPE, 0, 2);
  LogMessage('Your message goes here', EVENTLOG_WARNING_TYPE, 0, 3);
  LogMessage('Your message goes here', EVENTLOG_ERROR_TYPE, 0, 4);
 The message in the LogMessage call is not shown in event log.
  LogMessage('Your message goes here SUCC', EVENTLOG_SUCCESS, 0, 5);
  LogMessage('Your message goes here INFO', EVENTLOG_INFORMATION_TYPE, 0, 6);
  LogMessage('Your message goes here WARN', EVENTLOG_WARNING_TYPE, 0, 7);
  LogMessage('Your message goes here ERRO', EVENTLOG_ERROR_TYPE, 0, 8);
*/
//
//  Values are 32 bit values laid out as follows:
//
//   3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
//   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
//  +---+-+-+-----------------------+-------------------------------+
//  |Sev|C|R|     Facility          |               Code            |
//  +---+-+-+-----------------------+-------------------------------+
//
//  where
//
//      Sev - is the severity code
//
//          00 - Success
//          01 - Informational
//          10 - Warning
//          11 - Error
//
//      C - is the Customer code flag
//
//      R - is a reserved bit
//
//      Facility - is the facility code
//
//      Code - is the facility's status code
//
//
// Define the facility codes
//
#define FACILITY_SYSTEM                  0x0
#define FACILITY_STUBS                   0x3
#define FACILITY_RUNTIME                 0x2
#define FACILITY_IO_ERROR_CODE           0x4


//
// Define the severity codes
//
#define STATUS_SEVERITY_WARNING          0x2
#define STATUS_SEVERITY_SUCCESS          0x0
#define STATUS_SEVERITY_INFORMATIONAL    0x1
#define STATUS_SEVERITY_ERROR            0x3


//
// MessageId: CATEGORY_SUCCESS
//
// MessageText:
//
// %1
//
#define CATEGORY_SUCCESS                 ((WORD)0x00000001L)

//
// MessageId: CATEGORY_INFORMATION
//
// MessageText:
//
// %1
//
#define CATEGORY_INFORMATION             ((WORD)0x00000002L)

//
// MessageId: CATEGORY_WARNING
//
// MessageText:
//
// %1
//
#define CATEGORY_WARNING                 ((WORD)0x00000003L)

//
// MessageId: CATEGORY_ERROR
//
// MessageText:
//
// %1
//
#define CATEGORY_ERROR                   ((WORD)0x00000004L)

