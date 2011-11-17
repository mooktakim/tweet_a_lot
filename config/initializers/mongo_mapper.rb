if defined?(MongoMapper::Document)
  MongoMapper::Document.plugin(MongoMapper::Plugins::IdentityMap)
  #MongoMapper::Document.plugin(MongoMapper::AcceptsNestedAttributes)
  #MongoMapper::EmbeddedDocument.plugin(MongoMapper::AcceptsNestedAttributes)
end
