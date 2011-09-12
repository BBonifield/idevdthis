Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "dOGBqMnsuMBG2v8ddu94A", "PATuRQlfiDXB5oGrB4BYq7nUrWa6t0kq49V6gnDrw"

  if Rails.env.development?
    provider :facebook, "219656191424679", "f9b83224613db0282a21a7626c5c7950"
  end
  
  if Rails.env.production?
    provider :facebook, "250862708291260", "7acb4253a888305fbae04b799ad0e9af"
  end
end
