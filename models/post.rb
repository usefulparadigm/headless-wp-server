class Post
  include Mongoid::Document
  # include Mongoid::Timestamps # adds created_at and updated_at fields
  include Mongoid::Attributes::Dynamic

  # field <name>, :type => <type>, :default => <value>
  

  # You can define indexes on documents using the index macro:
  # index :field <, :unique => true>

  # You can create a composite key in mongoid to replace the default id using the key macro:
  # key :field <, :another_field, :one_more ....>

  validates_uniqueness_of :id

  def self.save_to_db(entries)
    entries.each do |entry|
      # puts entry[:id]
      doc = self.find_or_initialize_by(:id => entry[:id])
      doc.attributes = fields_for(entry)
      doc.upsert #save
    end
  end
  
  protected
  
  def self.fields_for(entry)
    entry.to_hash
  end

end
