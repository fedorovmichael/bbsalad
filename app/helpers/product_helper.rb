module ProductHelper
    def get_office_dishes
        office_dishes = Product.where(['product_type = ? and enable = ?', 'catering', true])
        Rails.logger.info office_dishes
        office_dishes      
    end
end
