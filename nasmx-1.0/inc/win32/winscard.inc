%ifndef __winscard_INC__
%define __winscard_INC__

IMPORT SCardAccessStartedEvent, 0
IMPORT SCardAddReaderToGroupA, 12
IMPORT SCardAddReaderToGroupW, 12
IMPORT SCardBeginTransaction, 4
IMPORT SCardCancel, 4
IMPORT SCardConnectA, 24
IMPORT SCardConnectW, 24
IMPORT SCardControl, 28
IMPORT SCardDisconnect, 8
IMPORT SCardEndTransaction, 8
IMPORT SCardEstablishContext, 16
IMPORT SCardForgetCardTypeA, 8
IMPORT SCardForgetCardTypeW, 8
IMPORT SCardForgetReaderA, 8
IMPORT SCardForgetReaderGroupA, 8
IMPORT SCardForgetReaderGroupW, 8
IMPORT SCardForgetReaderW, 8
IMPORT SCardFreeMemory, 8
IMPORT SCardGetAttrib, 16
IMPORT SCardGetCardTypeProviderNameA, 20
IMPORT SCardGetCardTypeProviderNameW, 20
IMPORT SCardGetProviderIdA, 12
IMPORT SCardGetProviderIdW, 12
IMPORT SCardGetStatusChangeA, 16
IMPORT SCardGetStatusChangeW, 16
IMPORT SCardIntroduceCardTypeA, 32
IMPORT SCardIntroduceCardTypeW, 32
IMPORT SCardIntroduceReaderA, 12
IMPORT SCardIntroduceReaderGroupA, 8
IMPORT SCardIntroduceReaderGroupW, 8
IMPORT SCardIntroduceReaderW, 12
IMPORT SCardIsValidContext, 4
IMPORT SCardListCardsA, 24
IMPORT SCardListCardsW, 24
IMPORT SCardListInterfacesA, 16
IMPORT SCardListInterfacesW, 16
IMPORT SCardListReaderGroupsA, 12
IMPORT SCardListReaderGroupsW, 12
IMPORT SCardListReadersA, 16
IMPORT SCardListReadersW, 16
IMPORT SCardLocateCardsA, 16
IMPORT SCardLocateCardsByATRA, 20
IMPORT SCardLocateCardsByATRW, 20
IMPORT SCardLocateCardsW, 16
IMPORT SCardReconnect, 20
IMPORT SCardReleaseContext, 4
IMPORT SCardReleaseStartedEvent, 0
IMPORT SCardRemoveReaderFromGroupA, 12
IMPORT SCardRemoveReaderFromGroupW, 12
IMPORT SCardSetAttrib, 16
IMPORT SCardSetCardTypeProviderNameA, 16
IMPORT SCardSetCardTypeProviderNameW, 16
IMPORT SCardState, 20
IMPORT SCardStatusA, 28
IMPORT SCardStatusW, 28
IMPORT SCardTransmit, 28
IMPORT g_rgSCardRawPci
IMPORT g_rgSCardT0Pci
IMPORT g_rgSCardT1Pci

%endif