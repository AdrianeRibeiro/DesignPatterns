class Profile
  def load_menu
    raise('not implemented')
  end
end

class MarketingProfile < Profile
  def load_menu
    {
      name: 'Marketing',
      features: %w[marketing_management marketing_automation]
    }
  end
end

class SalesProfile < Profile
  def load_menu
    {
      name: 'Sales',
      features: %w[sales_management sales_automation]
    }
  end
end

class ManagerProfile < Profile
  def load_menu
    {
      name: 'Manager',
      features: %w[admin_management]
    }
  end
end

class SlimProfile < Profile
  def load_menu
    {
      name: 'Slim',
      features: %w[slim_management]
    }
  end
end

class ProfileFactory
  def self.call(profile)
    if profile == 'marketing'
      MarketingProfile.new
    elsif profile == 'sales'
      SalesProfile.new
    elsif profile == 'manager'
      ManagerProfile.new
    else
      SlimProfile.new
    end
  end
end

class Application
  def render_menu(params)
    profile = ProfileFactory.call(params[:profile])
    profile.load_menu
  end
end

params = { profile: 'manager' }
menu = Application.new.render_menu(params)
puts menu
