class Profile
  def load_menu
    raise('not implemented')
  end
end

class MarketingProfile < Profile
  def load_menu
    {
      name: 'Marketing',
      features: %w[marketing_management],
      style: { class: 'marketing' }
    }
  end
end

class SalesProfile < Profile
  def load_menu
    {
      name: 'Sales',
      features: %w[sales_management],
      style: { class: 'sales' }
    }
  end
end

class ManagerProfile < Profile
  def load_menu
    {
      name: 'Manager',
      features: %w[admin_management],
      style: { class: 'manager' }
    }
  end
end

class SlimProfile < Profile
  def load_menu
    {
      name: 'Slim',
      features: %w[slim_management],
      style: { class: 'slim' }
    }
  end
end

class ProfileFactory
  def self.call(profile)
    case profile
    when 'marketing'
      MarketingProfile.new
    when 'sales'
      SalesProfile.new
    when 'manager'
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
