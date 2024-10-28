package internals

type Todo struct {
	Id          string `json:"id,omitempty"`
	Description string `json:"description,omitempty"`
}

type TodoRequest struct {
	Description string `json:"description,omitempty"`
}

type TodoResponse struct {
	Id string `json:"id,omitempty"`
}

type Feedback struct {
	Title       string `json:"title,omitempty"`
	Description string `json:"description,omitempty"`
	Comments    int    `json:"comments,omitempty"`
	Votes       int    `json:"votes,omitempty"`
	Tag         string `json:"tag,omitempty"`
}
