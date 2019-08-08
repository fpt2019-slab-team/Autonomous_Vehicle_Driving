#!/bin/bash

pray(){
    date '+%Y-%m-%d' |
    tr -d '\n' |
    cat

    date '+%w' |
    awk '{
        if(0){}
        else if($0 == 0){printf(" su ")}
        else if($0 == 1){printf(" mo ")}
        else if($0 == 2){printf(" tu ")}
        else if($0 == 3){printf(" we ")}
        else if($0 == 4){printf(" th ")}
        else if($0 == 5){printf(" fr ")}
        else if($0 == 6){printf(" sa ")}
    }' |
    cat

    echo $*
}
