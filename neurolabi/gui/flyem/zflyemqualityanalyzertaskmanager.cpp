#include "zflyemqualityanalyzertaskmanager.h"
#include "zflyemneuron.h"
#include "zswctree.h"
#include "flyem/zflyemqualityanalyzer.h"
#include "zflyemdatabundle.h"

ZFlyEmQualityAnalyzerTask::ZFlyEmQualityAnalyzerTask(QObject *parent) :
  ZTask(parent), m_source(NULL), m_dataBundle(NULL)
{

}

void ZFlyEmQualityAnalyzerTask::prepare()
{
  if (m_source != NULL) {
    ZSwcTree *tree = m_source->getModel();
    if (tree != NULL) {
      tree->getBoundBox();
    }
  }

  if (m_dataBundle != NULL) {
    std::vector<ZFlyEmNeuron>& neuronArray = m_dataBundle->getNeuronArray();
    for (size_t i = 0; i < neuronArray.size(); ++i) {
      ZSwcTree *tree = neuronArray[i].getModel();
      if (tree != NULL) {
        tree->getBoundBox();
      }
    }
  }
}

void ZFlyEmQualityAnalyzerTask::execute()
{
  if (m_source != NULL && m_dataBundle != NULL) {
    ZFlyEmQualityAnalyzer analyzer;
    m_hotSpotArray.concat(&(analyzer.computeHotSpot(m_source, *m_dataBundle)));
  }
}


ZFlyEmQualityAnalyzerTaskManager::ZFlyEmQualityAnalyzerTaskManager(
    QObject *parent) : ZMultiTaskManager(parent)
{

}


void ZFlyEmQualityAnalyzerTaskManager::prepare()
{
  m_hotSpotArray.clear();
}

void ZFlyEmQualityAnalyzerTaskManager::postProcess()
{
  if (!m_taskArray.empty()) {
    foreach (ZTask *task, m_taskArray) {
      ZFlyEmQualityAnalyzerTask *analyzerTask =
          dynamic_cast<ZFlyEmQualityAnalyzerTask*>(task);
      if (analyzerTask != NULL) {
        m_hotSpotArray.concat(analyzerTask->getHotSpot());
      }
    }
  }
}
