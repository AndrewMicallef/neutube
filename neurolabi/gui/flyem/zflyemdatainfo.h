#ifndef ZFLYEMDATAINFO_H
#define ZFLYEMDATAINFO_H

#include <vector>
#include <string>
#include "flyem/zflyem.h"

class ZFlyEmDataInfo
{
public:
  ZFlyEmDataInfo(FlyEm::EDataSet dataSet);

  void configure(FlyEm::EDataSet dataSet);

  inline const std::vector<int>& getStackSize() const {
    return m_stackSize;
  }

  inline const std::vector<double>& getVoxelResolution() const {
    return m_voxelResolution;
  }

  inline const std::vector<int>& getStartCoordinates() const{
    return m_startCoordinates;
  }

  inline int getBlockMargin() const {
    return m_blockMargin;
  }

  const char* getDvidAddress() const {
    return m_dvidAddress.c_str();
  }

  const char* getDvidUuid() const {
    return m_dvidUuid.c_str();
  }

private:
  FlyEm::EDataSet m_dataSet;
  std::vector<int> m_stackSize;
  std::vector<double> m_voxelResolution;
  std::vector<int> m_startCoordinates;
  int m_blockMargin;
  std::string m_dvidAddress;
  std::string m_dvidUuid;
};

#endif // ZFLYEMDATAINFO_H