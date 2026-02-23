from fastapi import APIRouter
from .schema import (
    EventListSchema, 
    EventSchema,
    EventCreateSchema,
    EventUpdateSchema
)

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
def create_event(payload:EventCreateSchema):
    # single row
    data=payload.model_dump()
    return {
        "id": 123,**data
    }

# read view api/events/12
@router.get('/{event_id}', response_model=EventSchema)
def get_event(event_id: int):
    

    data=payload.model_dump()       
    # single row
    return {
        "id": event_id,**data
    }

 #Put update this data
@router.put('/{event_id}', response_model=EventSchema)
def update_event(event_id: int, payload:EventUpdateSchema):
    print(payload.description)
    # single row
    return {
        "id": event_id,"description":payload.description
    }   

#Delete this data
@router.delete('/{event_id}', response_model=EventSchema)
def delete_event(event_id: int):
    # single row
    return {
        "id": event_id,
    }       