%ifndef __rpcns4_INC__
%define __rpcns4_INC__

IMPORT I_GetDefaultEntrySyntax, 0
IMPORT I_RpcNsGetBuffer, 4
IMPORT I_RpcNsNegotiateTransferSyntax, 4
IMPORT I_RpcNsRaiseException, 8
IMPORT I_RpcNsSendReceive, 8
IMPORT I_RpcReBindBuffer, 4
IMPORT RpcIfIdVectorFree, 4
IMPORT RpcNsBindingExportA, 20
IMPORT RpcNsBindingExportPnPA, 16
IMPORT RpcNsBindingExportPnPW, 16
IMPORT RpcNsBindingExportW, 20
IMPORT RpcNsBindingImportBeginA, 20
IMPORT RpcNsBindingImportBeginW, 20
IMPORT RpcNsBindingImportDone, 4
IMPORT RpcNsBindingImportNext, 8
IMPORT RpcNsBindingLookupBeginA, 24
IMPORT RpcNsBindingLookupBeginW, 24
IMPORT RpcNsBindingLookupDone, 4
IMPORT RpcNsBindingLookupNext, 8
IMPORT RpcNsBindingSelect, 8
IMPORT RpcNsBindingUnexportA, 16
IMPORT RpcNsBindingUnexportPnPA, 16
IMPORT RpcNsBindingUnexportPnPW, 16
IMPORT RpcNsBindingUnexportW, 16
IMPORT RpcNsEntryExpandNameA, 12
IMPORT RpcNsEntryExpandNameW, 12
IMPORT RpcNsEntryObjectInqBeginA, 12
IMPORT RpcNsEntryObjectInqBeginW, 12
IMPORT RpcNsEntryObjectInqDone, 4
IMPORT RpcNsEntryObjectInqNext, 8
IMPORT RpcNsGroupDeleteA, 8
IMPORT RpcNsGroupDeleteW, 8
IMPORT RpcNsGroupMbrAddA, 16
IMPORT RpcNsGroupMbrAddW, 16
IMPORT RpcNsGroupMbrInqBeginA, 16
IMPORT RpcNsGroupMbrInqBeginW, 16
IMPORT RpcNsGroupMbrInqDone, 4
IMPORT RpcNsGroupMbrInqNextA, 8
IMPORT RpcNsGroupMbrInqNextW, 8
IMPORT RpcNsGroupMbrRemoveA, 16
IMPORT RpcNsGroupMbrRemoveW, 16
IMPORT RpcNsMgmtBindingUnexportA, 20
IMPORT RpcNsMgmtBindingUnexportW, 20
IMPORT RpcNsMgmtEntryCreateA, 8
IMPORT RpcNsMgmtEntryCreateW, 8
IMPORT RpcNsMgmtEntryDeleteA, 8
IMPORT RpcNsMgmtEntryDeleteW, 8
IMPORT RpcNsMgmtEntryInqIfIdsA, 12
IMPORT RpcNsMgmtEntryInqIfIdsW, 12
IMPORT RpcNsMgmtHandleSetExpAge, 8
IMPORT RpcNsMgmtInqExpAge, 4
IMPORT RpcNsMgmtSetExpAge, 4
IMPORT RpcNsProfileDeleteA, 8
IMPORT RpcNsProfileDeleteW, 8
IMPORT RpcNsProfileEltAddA, 28
IMPORT RpcNsProfileEltAddW, 28
IMPORT RpcNsProfileEltInqBeginA, 32
IMPORT RpcNsProfileEltInqBeginW, 32
IMPORT RpcNsProfileEltInqDone, 4
IMPORT RpcNsProfileEltInqNextA, 20
IMPORT RpcNsProfileEltInqNextW, 20
IMPORT RpcNsProfileEltRemoveA, 20
IMPORT RpcNsProfileEltRemoveW, 20

%endif