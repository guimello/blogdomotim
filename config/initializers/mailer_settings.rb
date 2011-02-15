if(smtp_yml_path = File.join(Rails.root, 'config/smtp.yml')) && File.exists?(smtp_yml_path)
  # Load SMTP settings from the config/smtp.yml YAML file.
  smtp = ActiveSupport::HashWithIndifferentAccess.new(YAML::load(File.read(smtp_yml_path)))

  ActionMailer::Base.smtp_settings = smtp[Rails.env]
elsif (sendmail_yml_path = File.join(Rails.root, 'config/sendmail.yml')) && File.exists?(sendmail_yml_path)
  # Load SMTP settings from the config/smtp.yml YAML file.
  sendmail = ActiveSupport::HashWithIndifferentAccess.new(YAML::load(File.read(sendmail_yml_path)))

  ActionMailer::Base.sendmail_settings = sendmail[Rails.env]
end
