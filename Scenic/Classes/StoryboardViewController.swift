import UIKit

class StoryboardViewController: UIViewController, StoryboardManagedScene {
  
  internal var storyboardSegueHandler: StoryboardSegueHandler!
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    storyboardSegueHandler.prepare(for: segue, sender: sender)
    
  }
  
}

