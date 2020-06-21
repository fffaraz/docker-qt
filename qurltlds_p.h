// qtbase/src/network/kernel/qurltlds_p.h

#ifndef QURLTLD_P_H
#define QURLTLD_P_H

#include <QtNetwork/private/qtnetworkglobal_p.h>

QT_BEGIN_NAMESPACE

static const quint16 tldCount = 1;

static constexpr quint32 tldIndices[tldCount + 1] = {0, 1};

static const quint16 tldChunkCount = 2;
static const char * const tldData[tldChunkCount] = {"\0", "\0"};

static constexpr quint32 tldChunks[tldChunkCount] = {0, 1};

QT_END_NAMESPACE

#endif // QURLTLD_P_H
