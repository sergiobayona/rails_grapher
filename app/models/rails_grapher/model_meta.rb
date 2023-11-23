module RailsGrapher
  class ModelMeta
    def initialize(model)
      @model = model
    end

    def attributes
      model_column_names = @model.constantize.columns.map(&:name).sort
      model_column_names.map do |col_name|
        {
          col_name => {
            'type': @model.constantize.columns_hash[col_name].type,
            'limit': @model.constantize.columns_hash[col_name].limit,
            'default': @model.constantize.columns_hash[col_name].default,
            'null': @model.constantize.columns_hash[col_name].null
          }
        }
      end
    end

    def associations
      association_names = @model.constantize.reflect_on_all_associations.map(&:name).sort
      association_names.map do |assoc|
        {
          assoc => {
            'type': @model.constantize.reflect_on_association(assoc).macro,
            'options': @model.constantize.reflect_on_association(assoc).options
          }
        }
      end
    end

    # group validations by model attribute
    def validations
      @model.constantize.validators.map(&:attributes).flatten.uniq.sort.map do |attribute|
        {
          attribute => get_validations(attribute)
        }
      end
    end

    def scopes
      @model.constantize.methods(false).grep(/scope/).map(&:to_s).sort
    end

    def methods
      @model.constantize.methods(false).grep_v(/scope/).map(&:to_s).sort
    end

    private

    def get_validations(attribute)
      @model.constantize.validators.select do |v|
        v.attributes.include?(attribute)
      end.map(&:class).map(&:to_s).map(&:demodulize).uniq.sort
    end # get_validations
  end
end
