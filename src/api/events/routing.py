from fastapi import APIRouter
from .schema import EventListSchema, EventSchema

router = APIRouter()

#/api/events
@router.get('/', response_model=EventListSchema)
def read_events():
    # multiple rows
    return {
        "results": [
            {"id": "1"},
            {"id": "2"},
            {"id": "3"},
        ],
        "count": 3
    }

# create view
@router.post('/', response_model=EventSchema)
def create_event(data:dict={}):
    # single row
    return {
        "id": 123,
    }

# read view api/events/12
@router.get('/{event_id}', response_model=EventSchema)
def get_event(event_id: int):
    # single row
    return {
        "id": event_id,
    }