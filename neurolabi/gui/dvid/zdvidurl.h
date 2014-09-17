#ifndef ZDVIDURL_H
#define ZDVIDURL_H

#include <string>

#include "dvid/zdvidtarget.h"
#include "dvid/zdviddata.h"

class ZDvidUrl
{
public:
  ZDvidUrl();
  ZDvidUrl(const std::string &serverAddress, const std::string &uuid, int port);
  ZDvidUrl(const ZDvidTarget &target);

  std::string getNodeUrl() const;
  std::string getDataUrl(const std::string &dataName) const;
  std::string getDataUrl(ZDvidData::ERole role) const;
  std::string getInfoUrl(const std::string &dataName) const;
  std::string getHelpUrl() const;
  std::string getServerInfoUrl() const;
  std::string getApiUrl() const;
  std::string getRepoUrl() const;
  std::string getInstanceUrl() const;

  std::string getSkeletonUrl() const;
  std::string getSkeletonUrl(int bodyId) const;

  std::string getThumbnailUrl() const;
  std::string getThumbnailUrl(int bodyId) const;

  std::string getSp2bodyUrl() const;
  std::string getSp2bodyUrl(const std::string &suffix) const;

  std::string getSparsevolUrl() const;
  std::string getSparsevolUrl(int bodyId) const;

  std::string getGrayscaleUrl() const;
  std::string getGrayscaleUrl(int sx, int sy, int x0, int y0, int z0) const;
  std::string getGrayscaleUrl(int sx, int sy, int sz, int x0, int y0, int z0)
   const;

  std::string getKeyUrl(const std::string &name, const std::string &key) const;
  std::string getKeyRangeUrl(
      const std::string &name,
      const std::string &key1, const std::string &key2) const;

  std::string getAnnotationUrl() const;
  std::string getAnnotationUrl(int bodyId) const;

  std::string getBoundBoxUrl() const;
  std::string getBoundBoxUrl(int z) const;

private:
  ZDvidTarget m_dvidTarget;
};

#endif // ZDVIDURL_H