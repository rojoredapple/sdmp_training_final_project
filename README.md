# Application Architecture

The central model of my application is 'Event'. The other model of my
application is 'Attendee'. While 'Event' initializes the name, start time, and
end time of any event, 'Attendee' initializes the email and event id required to
check into any of the existing events. The root page includes a listing that
displays all of the events currently loaded in the database. When the user
clicks on the 'Show' link, the resulting page shows the details of the event,
as well as a list of attendees underneath if others have checked into that
particular event. Furthermore, events can be canceled from the home page, which
would also destroy any corresponding attendees who are checked into that event.
In addition, the root page contains links to two forms, which include 'Create
Event' and 'Check into Event'. The first link allows a user to exclusively
create an event by inputting an event name and selecting a start time and end
time, while the other link allows a user to check into an event by inputting
their email and selecting an existing event.
