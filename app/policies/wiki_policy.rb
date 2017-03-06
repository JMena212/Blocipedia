class WikiPolicy < ApplicationPolicy
    
    def show?
      !record.private? || user.premium?
    end

private

    def wiki
        record
    end
end