require "body";
require "fileinto";

if header :contains "X-Spam" "Yes" {
  fileinto "Junk";
}

if body :contains ["change your password", "secure your account"] {
  fileinto "Junk";
}
