CREATE EVENT SESSION [New] ON SERVER 
ADD EVENT [sqlserver].[lock_acquired]
    (
    ACTION ([sqlserver].[query_hash])
    WHERE ([package0].[greater_than_uint64]([database_id],(4)) AND [package0].[equal_boolean]([sqlserver].[is_system],(0)))
    ), 
ADD EVENT [sqlserver].[lock_deadlock], 
ADD EVENT [sqlserver].[xml_deadlock_report] 
ADD TARGET [package0].[histogram]
    (
    SET filtering_event_name = N'sqlserver.lock_acquired',
        source = N'sqlserver.query_hash'
    )
WITH  (
        MAX_MEMORY = 4 MB,
        EVENT_RETENTION_MODE = ALLOW_SINGLE_EVENT_LOSS,
        MAX_DISPATCH_LATENCY = 30 SECONDS,
        MEMORY_PARTITION_MODE = NONE,
        TRACK_CAUSALITY = ON,
        STARTUP_STATE = OFF
      );

