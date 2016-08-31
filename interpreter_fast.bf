# CODE SYM ASCII
# 1    [   91
# 2    ]   93
# 3    +   43
# 4    ,   44
# 5    -   45
# 6    .   46
# 7    <   60
# 8    >   62

# Memory layout:
#   0   0
#   IPF I
#   ...
#   0   0
#   DPF D
#   ...
#   0   0

# Local memory:
# T1   -   MF/T2   I/D   T3


# TODO: Error handling


-[+
    >>

    >> >>+[-<<
        # the common EOF implementations (0, -1, and no change), as well
        # as ASCII 33 ('!') are all interpreted as the ! instruction
        ,
                                    <<+>>
        +                       [
        -                       [
        >++++++[<----->-]<---   [   <+++> <<->>
        ----------              [   <+>
        -                       [   <+>
        -                       [   <+>
        -                       [   <+>
        --------------          [   <+>
        --                      [   <[-]+>
        >+++++++[<---->-]<-     [   <+>
        --                      [   <[-]> >>+<<
        [-]]]]]]]]]]]]
    >>]<< <<

-]

>>+<<
<[<<]<


>>>
[

    # TODO: All instructions have a similar format
    #       move to DP -> do something -> move to IP
    #       Perhaps should copy instruction to near DP, and branch from there

    # branch for instruction execution
    [>+<<+>-]<[>+<-]+>
    >-[-[-[-[-[-[-[-

    # >
    <<
        >>-[+>>-]+
        ->>+
        <<-[+<<-]

    # <
    >>]<<[
        >>-[+>>-]+
        -<<+
        <<-[+<<-]

    # .
    ]>>]<<[
        >>-[+>>-]+
        >.<
        <<-[+<<-]

    # -
    ]>>]<<[
        >>-[+>>-]+
        >-<
        <<-[+<<-]

    # TODO: Make , independent of interpreter's EOF implementation
    # ,
    ]>>]<<[
        >>-[+>>-]+
        >,<
        <<-[+<<-]

    # +
    ]>>]<<[
        >>-[+>>-]+
        >+<
        <<-[+<<-]

    # ]
    ]>>]<<[
        # if mem[DP] =/= 0
        >>-[+>>-]
        >[>+<<+>-]<[>+<-]+
        >>[[-]<<
            <<-[+<<-]

            # until we return to starting point
            >>+<<
            -[+<<

                # scroll left for unvisited [
                >-[+<<-]+<
                [[-]++<-[+<<-]+<]
                +

                # scroll right for unvisited ]
                [>>>--[++>>--]++<]
                ++

            >>-]<<

            # clear visit marks
            -[+ [-] <<-]+


            >>-[+>>-]+
        >>]<<
        <<-[+<<-]

    # [
    ]>>]<<[
        # if mem[DP] = 0
        >>-[+>>-]
        >>+<[>[-]<<+>-]<[>+<-]+
        
        >>[[-]<<
            <<-[+<<-]

            # until we return to starting point
            <<+>>
            -[+>>

                # scroll right for unvisited ]
                >--[++>>--]++<
                [[-]++>>>--[++>>--]++<]
                +

                # scroll left for unvisited [
                [<-[+<<-]+<]
                ++

            <<-]>>

            # clear visit marks
            -[+ [-] >>-]+


            >>-[+>>-]+
        >>]<<
        <<-[+<<-]

    ]>

    >>
]



#   Alternative ] algorithm. It is larger, but it may be possible to
#   combine [ and ] with it
#>
#    -[+<<-]+
#    ++
#
#    --[++>>--]++
#    ++
#
#    <-[+>
#
#        ---[+++<<---]+++
#        --
#        <<
#        -[+<<-]+
#        ++<
#
#        ----[++++>>----]++++
#        --
#        >>
#        --[++>>--]++
#        ++
#
#    <-]>
#
#    --
#    ---[+++<<---]+++
#    --
#<
#+
