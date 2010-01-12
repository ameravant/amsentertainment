class AmsToVersion20091222221023AndSiteninjaBlogsToVersion20090915210807AndSiteninjaCoreToVersion20090923194400AndSiteninjaLinksToVersion20090904173743AndSiteninjaPagesToVersion20091023184310 < ActiveRecord::Migration
  def self.up
    Engines.plugins["ams"].migrate(20091222221023)
    Engines.plugins["siteninja_blogs"].migrate(20090915210807)
    Engines.plugins["siteninja_core"].migrate(20090923194400)
    Engines.plugins["siteninja_links"].migrate(20090904173743)
    Engines.plugins["siteninja_pages"].migrate(20091023184310)
  end

  def self.down
    Engines.plugins["ams"].migrate(0)
    Engines.plugins["siteninja_blogs"].migrate(0)
    Engines.plugins["siteninja_core"].migrate(0)
    Engines.plugins["siteninja_links"].migrate(0)
    Engines.plugins["siteninja_pages"].migrate(0)
  end
end
