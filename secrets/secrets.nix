let
   userKeys = [
    # Tower
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKHiqx6pJQP+vgI389GAgz1aFnnYSfvWQJ60d50VlIpZ danil80sch@gmail.com"
    # Laptop
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCzO9dqxi7X2uR6IFpDgZkVxNvoSlG9JibFXcPiNdqRrujDclb9rHx+bB9nuOJuiZkSlpRHHxvMNCvRGJdWE/SHcOqV0P+reRQDZUQYxdUZwvfX6QEop66B6iKfCq+wukkDzZnXDsKufviytvt0T+J/F0ybP34zAsg/gqAR6DwZlvdJTwAPwAvVdzZV3EKFw/TNhXoEfMdgtvr1a7mgEoJPsjvovNVmyYxduICQSzaeLTLRviCD7BHQqgZQ4Oct1P2z4U1Ij61Ukpgot8OVPxiV+yNlFN7euKRP2Ibl+QQiIg9y8DdwV7hNWd9yDC1tVVO+RATd8PrtbiijAul6i7bGr+ogIjVlFF/0xZKrTVS6xQ1MWjUHAlrqgCfGVT09GkP9/RMwgYgRGNs4iFhw9Qmsy/d2FOTwtnwIzNpcD0/zHGM665AIBL9gPQMMkTBksQSFDjR4+VmvWVijyafDLyr7yJOc9WfoMYWKjBHfF9LP0TSNCzxNP7nC0sai4k3KX72WonCm45JpeM5z5J9aJGjsH9EA4av/+R0otfHeejUmNsDh5I36k7RC4XjdcK2zLDSTbReazQUo116LGM4NSTqOShH9sq2xke8BOvM1bQo2b+y0crnoZxWSkAeGkLFAkXCCIdBJa4aYF62U4l7D0WpsBQPI8VSAChHgJzYHMPuznw== d.schumin@proton.me"
    # Server
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCkBDO0rkm/igp1lc0JCoxzRNRWd94z+FJ5DV0vW5T9C+ChuiBJWBAEqhnpXq7sgYr4MbXwYw16Kk5WNls55D5F0GG/XMBsjJuTXjPu92URVPoqja1DQ3Nvb2DCxc5Y4+Dr4u/FY97Jp/LcoT4NQ25S697/kGwXTbOSvW7szObBoycZamGc0VNlyS1qYY14cHMIuLsxUvJcahbU3Pne3TE98tGkk7a1q1Arlyo2fNcF0GhKW7SXpmW0nVnTapn+gixVnDOcovluS9fCDOCU3mkyPjFhtxmvI6DTnqHRj6SzyP6v1ml6nL1Mlgj3ejBFVNBHULQlapsdTye7oSykF91Gr59B5mmoOlS8o6KDtNRCEOSS+hLezbNYIGw/rjVJdco8dbUt1thCoarZpzMFFAb+fjIXYilb1i0h1tMyjcj+8Lke7LtCtpBy85ux0q3T0tG8xqlvW5oGkbkVWvonuw0Seqkp5M8MQUYDgzPMIrD+YPQN5/3uXO3AbOkE8+/pruDX130JhSKoh9D/5Q71zJ/sR1piwsudnfsKhveJPVvcjOlc2dl9kk0dRXhSHDdmpDWZ5Jvrw0OFcKVZO1g62JRy2qwfVmN4YdrKb3aeehwh9xW975lZPrxsdQmg22BtyifxOuiqcNaW5/tygGNwZHvF4ZOFbW9ppwMQZKLtV8yzhQ== d.schumin@proton.me"
   ];

   systemKeys = [
   # Tower
   "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCeVH6uYgLOH1ufxJdguWIvx4CFHZ4g0HaXk/x33FZORWboF0STJF1aVWmpRpk0x/mdehac4ZICaX2dI+kUpVzNeFraggkmr5i8dIvYcfswW8aPZUmWB1RM5ydiFh3LOQxIipoSE4L2SyxPCAb5DTzSkiEe4w0nLEuHvBhK/uB9is7mLcoIGlMfKq6/u+6UaLm+qTH+JFdFcHJjsyc2Rabgj1MDrXI7d5ilra2nzBFIEgoL+mZnpqtpXv5Tv+s+tTjeXhysyr1GepFB8/1LgmVI9tAj6eKPixnxHj/PU34+U3Bzveh45u8Aa5oTZ1A00a6ddpwktWW33oCkn+yeVjJ0JLpFmu8rDaEKJ2vosTgTNVZ0/jsPMfeWtpEJgF9aDcnDziWZCQ9has0hfWhAe4kp2mkXPDSJqwE2G/epicS3tqhsEUOfAUly1HPVVZPufELJxI7VJGkVUNo6mbsT546CqhiuscA+01QuXYEmVV74B2axXr8O0XzYMIvySwtGi7gbr4c1xJqjPRqe4eH0iD6jZU70luRd8tusTvPuqQ3Ap5RZaNxESwrsPSaWbidFwb+3AmNgf7RQIX9UAyPiYlLU3QeGHzPOqXVCvFsAxozR93kxhFmkaQ84XQ0Tkw3QMuxSsqzSmF7/XwTXD/vncR/OFX1OtzmOqzBJ4afTSlrDsw== root@nixos"
   # Laptop
   "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDDCYhkPTvUC9Mnfhx7ecgkSC96Ru59dQcGqEthRo632TRLF3newil5yGgqraIEoDRp1Fd+P6PLbYjIObxk30RJhQKJ/VcMCTqQzjeUPh+5DGgM7ZHPw3eM9/41YZo8Mq4qfsKSoQVE4ZpOneyNECGzWDf/UF8FdrQ4n8C55HKd0G5schoscZ9d436PVyYsAQr+mU57zu4ZlnHaKOgdih+o3BmacCvysH64fzv6SE3+9k2ERtgb3h+fDcR6MBJYVdGiuFwYPTXIaU2W01FN1XMBSjgxWnWsK5CNPavNmjZHpK5HG3NU03HUcCTJQ93phLjLrUlRcsd//avG70eTr0fCkhu6Tl6Y4Eu+KTNPQSbPkVI+6UwqxQvJxYcLB5FUjiYH/+Hx8UVnszse70+Q6T8YaWEjwYLMyXTOWveITP4IuyD39hm8BdaSdqZhggoBmw4AgoJ3eG92fkk/AzxOyFGXJX7NSqe31KmPlCdd4KuNNlTiRYi786hRjSFV5JgJ2j9eHxztYlEBU38WafANeod1pChFfw6RVfTtNTK9Mou9JUxNc4VWTQj5RHEKq4KoDu7OHLhwkpPrJYvH4aGGfE73KPLt2J9NYoScbHk0f4cxdVMYhVCWZamXqKJQznO3jblpihFj+SOMo3wiDw/YQ5i1qVPGt9Ci0U5oFnhJqKI6Zw== root@nixos"
   # Server
   "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDm3TOI6Wpl3CNoc+w+px4DmzfMdU4WT2zm2HXlonHunCu3Ik5zGo4wh8P/PT9+b/5JovrjI0seh8a/cP70R6jpAQdTdsiTF1ReXuPj2XgfnCM6MTBLkrMC+PH7GUbP43XqFB5Y2HIWsydaFlb6Rupln2IkVe3uYfGHZK3eRA5/J7EDLbQMutZwLHJZcMYcFuQ+RKbRoJ9pWH1rl4K28Gd9SQZSvher5GQz4OvhqW2G65vDkApDyakmHtNtUhYAFFKa3bX/92NS0nQUno3KN8943D9t5ii1It5uOS+Kokc1Abq19AfQhbCyjOZCRDTK2YtJN31jcGbmwnU+Eh8bStvBdGM064i77xwDxzwq35O7CrSGeti2dVKJWAAvfTYgaKf+nCztK7uDe22TEFr2+JYJ9kks6h3C6leEX8jU+mxsZPNYTmndNjJTmswimWshgQ67QFPhFKoIhgasUYdZ7HwcwRfm014II2CuThEQSDTeR5oM+REVYcr1VIJ1rnrUQn8WIBNCTtJV42KZ7Y7EKZycnmlkMzHRoJXDoRnFwFEvpoYvBobU54EYFEJmB7aawDdnJ1r15vErEnZoyaqdeorzjjDGu4JbA147LFzEggyPIzlYA90kOnET6mgEmYOwq9diK4qKE7mYzhPVHBx2Ncvx6L/Rd3jT3+oDeXLH9MMFKw=="
   ];

   allKeys = userKeys ++ systemKeys;
in
{
    # Desktop env files
    "wifi-profiles.env.age".publicKeys = allKeys;

    # Privat Keys
    "wg-vpn.key.age".publicKeys = allKeys;
    "wg-vpn.paired-key.age".publicKeys = allKeys;

    # Server Files
    "cloudflare.env.age".publicKeys = allKeys;
    "firefly.env.age".publicKeys = allKeys;
    "vaultwarden.env.age".publicKeys = allKeys;
}
