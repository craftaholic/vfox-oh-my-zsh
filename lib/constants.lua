local m = {}

m.INSTALL_SCRIPT_URL = "https://raw.githubusercontent.com/craftaholic/ohmyzsh/master/tools/install.sh"
m.EXPECTED_CHECKSUM = "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"

m.VERSIONS = {
  {
    version = "latest",
    note = "latest",
    url = m.INSTALL_SCRIPT_URL,
    checksum = m.EXPECTED_CHECKSUM,
  }
}

return m
