//
//  BluetoothPeerController.h
//  ExtendedRealityGames
//
//  Created by Daniel  Ortiz on 10/2/09.
//

// Protocol picks the abstract class 
@protocol BluetoothPickerControllerDelegate <NSObject>
@required
-(void) setGameState:(NSInteger)gameState;			/* Set the game state */
-(void) invalidateGameSession;						/* Invalidate the game session */
-(void) setSession:(GKSession *)session;			/* Set the new session */
-(NSInteger) getSessionID;							/* Get the session id */
@end


@interface BluetoothPeerController : NSObject {
	GKPeerPickerController * picker;
	id delegate;
}

@property (nonatomic, retain) GKPeerPickerController * picker;
@property (nonatomic, assign) id<BluetoothPickerControllerDelegate>;

/* Peer picker controller delegate functions */
-(void)peerPickerControllerDidCancel:(GKPeerPickerController*)p;
-(void)peerPickerController:(GKPeerPickerController*)p didSelectConnectionType:(GKPeerPickerConnectionType)type;
-(GKSession*)peerPickerController:(GKPeerPickerController*)p sessionForConnectionType:(GKPeerPickerConnectionType)type;
-(void) peerPickerController:(GKPeerPickerController*)p didConnectPeer:(NSString*)peerID toSession:(GKSession*)session;
@end
