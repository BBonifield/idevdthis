Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "dOGBqMnsuMBG2v8ddu94A", "PATuRQlfiDXB5oGrB4BYq7nUrWa6t0kq49V6gnDrw"
  provider :facebook, "219656191424679", "f9b83224613db0282a21a7626c5c7950"
end
