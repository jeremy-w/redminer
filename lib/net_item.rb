# Author:: Jeremy W. Sherman
# Copyright:: 2012 Jeremy W. Sherman
# License:: 3-clause BSD (see LICENSE for its full glory)

# Fetches a keychain Internet password by label.
# Basically, it just does this:
#
#     +security find-internet-password -l #{LABEL} -g+
#
# And then picks things out of the output using regexen.
class NetItem
	attr_reader :label, :account, :server, :password, :apikey

	def check(m, what, missing)
		return m[1] if m

		missing << what
		$stderr.puts "#{what} not found for label #{@label}"
		return nil
	end

	def initialize(label)
		@label = label

		missing = []
		blob = `security find-internet-password -l #{label} -g 2>&1`
		m = /^\s+"acct"<blob>="(.*)"\s*$/.match(blob)
		@account = check(m, "account", missing)

		m = /^\s+"ptcl"<uint32>="(.*)"\s*$/.match(blob)
		fourchar = check(m, "protocol", missing)
		protocol = fourchar == "htps" ? "https://" : "http://"

		m = /^\s+"srvr"<blob>="(.*)"\s*$/.match(blob)
		host = check(m, "server", missing)
		if host
			@server = protocol + host
		end

		m = /^password: "(.*)"$/.match(blob)
		@password = check(m, "password", missing)

		m = /api: ([0-9A-Fa-f]+)/.match(blob)
		@apikey = check(m, "api key", missing)

		if missing.size > 0
			msg = "#{server} keychain item missing: #{missing.join(', ')}"
			e = Exception.new(msg)
			raise e
		end
	end
end

