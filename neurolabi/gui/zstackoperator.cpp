#include "zstackoperator.h"
#include "zmouseeventrecorder.h"

ZStackOperator::ZStackOperator() : m_op(OP_NULL), m_hitNode(NULL),
  m_punctaIndex(-1), m_mouseEventRecorder(NULL)
{
}

bool ZStackOperator::isNull() const
{
  return getOperation() == OP_NULL;
}

ZPoint ZStackOperator::getMouseOffset(ZMouseEvent::ECoordinateSystem cs) const
{
  ZPoint offset(0, 0, 0);

  if (m_mouseEventRecorder != NULL) {
    offset = m_mouseEventRecorder->getPositionOffset(cs);
  }

  return offset;
}