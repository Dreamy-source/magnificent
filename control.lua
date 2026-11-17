while true do
    print("1. start")
    print("2. flush")

    local choice = io.read()

    if choice == "1" then
        os.execute("sudo nft flush ruleset")
        os.execute("sudo pkill nfqws")

        os.execute("sudo nft -f nftables.nft")
        os.execute("sudo nfqws --qnum=200 --filter-tcp=443 --filter-udp=443 --dpi-desync=fake,multisplit --dpi-desync-split-pos=1,midsld --dpi-desync-repeats=6 --dpi-desync-fooling=badseq --dpi-desync-fake-tls=!")
    end
    if choice == "2" then
        os.execute("sudo nft flush ruleset")
        os.execute("sudo pkill nfqws")
    end
end
