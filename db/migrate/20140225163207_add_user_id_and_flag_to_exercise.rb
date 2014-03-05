class AddUserIdAndFlagToExercise < ActiveRecord::Migration

[
  {name: 'Pushups'  }   
  {name: 'Pullups'  }   
  {name: 'Situps'   }    
  {name: 'Squats'   }    
  {name: 'Lunges'   }    
  {name: 'Burpees'  }   
  {name: 'Running'  }   
  {name: 'Biking'   }    
  {name: 'Swimming' }  
  {name: 'Hiking'   }    
  {name: 'Walking'  }   
  {name: 'Aerobics' }  
  {name: 'Zumba'    }     
  {name: 'Yoga'     }      
].each do |exercise|
  Exercise.find_by(name: exercise).update_attributes(approved: true)
end

  def change
    add_column :exercises, :approved, :boolean
    add_column :challenge_attempts, :activity_id, :integer
    add_index :challenge_attempts, [:user_id, :challenge_id]
    drop_table :exercise_sets
    drop_table :user_exercises
  end
end
