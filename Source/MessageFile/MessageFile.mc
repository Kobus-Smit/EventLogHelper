; /* -------------------------------------------------------------------------
; HEADER SECTION
;*/
SeverityNames=(Success=0x0:       STATUS_SEVERITY_SUCCESS
               Informational=0x1: STATUS_SEVERITY_INFORMATIONAL
               Warning=0x2:       STATUS_SEVERITY_WARNING
               Error=0x3:         STATUS_SEVERITY_ERROR
              )

FacilityNames=(System=0x0:  FACILITY_SYSTEM
               Runtime=0x2: FACILITY_RUNTIME
               Stubs=0x3:   FACILITY_STUBS
               Io=0x4:      FACILITY_IO_ERROR_CODE
              )

LanguageNames=(English=0x409:MSG00409)
;LanguageNames=(German=0x407:MSG00407)

;
;/* -------------------------------------------------------------------------
; MESSAGE DEFINITION SECTION
;*/

MessageIdTypedef=WORD

;/*
; The message in the LogMessage call is shown in event log.
;  LogMessage('Your message goes here', EVENTLOG_SUCCESS, 0, 1);
;  LogMessage('Your message goes here', EVENTLOG_INFORMATION_TYPE, 0, 2);
;  LogMessage('Your message goes here', EVENTLOG_WARNING_TYPE, 0, 3);
;  LogMessage('Your message goes here', EVENTLOG_ERROR_TYPE, 0, 4);
; The message in the LogMessage call is not shown in event log.
;  LogMessage('Your message goes here SUCC', EVENTLOG_SUCCESS, 0, 5);
;  LogMessage('Your message goes here INFO', EVENTLOG_INFORMATION_TYPE, 0, 6);
;  LogMessage('Your message goes here WARN', EVENTLOG_WARNING_TYPE, 0, 7);
;  LogMessage('Your message goes here ERRO', EVENTLOG_ERROR_TYPE, 0, 8);
;*/

MessageId=0x1
Severity=Success
Facility=Application
SymbolicName=CATEGORY_SUCCESS
Language=English
%1
.

MessageId=0x2
Severity=Success
Facility=Application
SymbolicName=CATEGORY_INFORMATION
Language=English
%1
.

MessageId=0x3
Severity=Success
Facility=Application
SymbolicName=CATEGORY_WARNING
Language=English
%1
.

MessageId=0x4
Severity=Success
Facility=Application
SymbolicName=CATEGORY_ERROR
Language=English
%1
.
