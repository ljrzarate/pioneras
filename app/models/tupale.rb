class Tupale
  BASE_URL = "https://tupale.co"
  PROFILE_FORM_ID = 257
  PATH = "/milfs/api.php?id="
  URL = "#{BASE_URL}#{PATH}#{PROFILE_FORM_ID}"
  IMAGE_URL = "https://tupale.co/milfs/images/secure/?file=300/"

  def self.fetch_profiles
    response = RestClient.get(URL, headers={})
    group_by_id(JSON.parse(response.body))
  end

  private
    def self.group_by_id(json)
      resp = []
      all_ids(json).each do |id|
        e = {"#{id}"=> json.select {|e| e["identificador"] == id} }
        resp << e
      end
      resp
    end

    def self.all_ids(json)
      resp = []
      json.each do |element|
        resp << element["identificador"]
      end
      resp.uniq
    end
end
