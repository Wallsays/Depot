class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation

  validates :name,     presence: true, uniqueness: true
  validates :password, presence: true
  has_secure_password

  after_destroy :ensure_an_admin_remains

  private
    def ensure_an_admin_remains
      if User.count.zero?
        # в случае возникновения становится причиной автоматического отката
        #
        # исключение сигнализирует контроллеру об ошибке там, где 
        # используется блок begin-end для его обработки, и 
        # выводит пользователю флэш сообщение об ошибке.
        raise "Can't delete last user"
        # ActiveRecord::Rollback # if without message
      end
    end
  

end
