//
//  LoggedInComponent+OffGame.swift
//  TicTacToe
//
//  Created by 현은백 on 2022/01/20.
//  Copyright © 2022 Uber. All rights reserved.
//

import RIBs

/// The dependencies needed from the parent scope of LoggedIn to provide for the OffGame scope.
// TODO: Update LoggedInDependency protocol to inherit this protocol.
protocol LoggedInDependencyOffGame: Dependency {
    // TODO: Declare dependencies needed from the parent scope of LoggedIn to provide dependencies
    // for the OffGame scope.
}

extension LoggedInComponent: OffGameDependency {

    var scoreStream: ScoreStream {
        return mutableScoreStream
    }
    // TODO: Implement properties to provide for OffGame scope.
}
