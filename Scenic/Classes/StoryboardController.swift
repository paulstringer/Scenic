import UIKit

struct StoryboardSegueHandler {
  
  let context: StoryboardContext
  
  func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let storyboardController = StoryboardController(segue: segue, sender: sender, context: context)
    storyboardController.prepare()
  }
  
}

protocol StoryboardVisitableScene {
  func accept(visitor: StoryboardSceneVisitor)
}

protocol StoryboardManagedScene {
  var storyboardSegueHandler: StoryboardSegueHandler! { get set }
}

struct StoryboardController: StoryboardSceneVisitor {
  
  let segue: UIStoryboardSegue
  let sender: Any?
  let context: StoryboardContext
  
  func prepare() {
    setSegueHandlerOnDestination()
    dispatchVisitorToDestination()
  }
  
  private func setSegueHandlerOnDestination() {
    guard var destination = segue.destination as? StoryboardManagedScene else { return }
    destination.storyboardSegueHandler = StoryboardSegueHandler(context: context)
  }
  
  private func dispatchVisitorToDestination() {
    guard let destination = segue.destination as? StoryboardVisitableScene else { return }
    destination.accept(visitor: self)
  }
  
}

protocol StoryboardSceneVisitor {
  
  // methods that prepare each scene:
  
}

