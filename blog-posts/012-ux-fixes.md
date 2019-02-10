---
title: Day 012 - Making a TODO list
published: true
description: UX fixes for app and it's done.
tags: swift, iOS
---

[GitHub Repo](https://github.com/maeganjwilson/todo_list)

This post I am going to focus on some UX decisions that I made early on, and I believe are not very UX friendly.
 
# Things I want to accomplish

- [Dismiss keyboard with "Done" button](https://github.com/maeganjwilson/todo_list/issues/5)
- [Don't add an empty task](https://github.com/maeganjwilson/todo_list/issues/6)

# Things I accomplished

- Dismissing keyboard with "Done button"
- Don't add an empty task


# Things I learned

## How to present an alert

To make the user aware of the of not adding an empty task, I had to present an alert.

Here is how I did it.

```swift
// 1
let alert = UIAlertController(title: "No task entered", message: "You cannot have a blank task. Tap OK and enter a task.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("CLOSED ALERT")
            }))
// 2
            self.present(alert, animated: true, completion: nil)
```

1. Declares the alert
2. Makes the alert pop up

---

If you have any questions about what I did or how I implemented anything, let me know! If you have any suggestions or other comments, let me know as well!
Over all the app is done. I plan on making more adjustments in order to release it to the app store. You can keep up with my progress and goals at my [GitHub repo](https://github.com/maeganjwilson/todo_list).

THANKS FOR READING! I'll make another post after I launch the app.