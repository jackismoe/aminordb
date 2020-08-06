# reset
User.destroy_all
Song.destroy_all

# create users
jackson = User.create(username: 'jackismoe', password: '1111')
lauren = User.create(username: 'lkane11', password: '2222')
smudge = User.create(username: 'lilbeardie23', password: '3333')

# jackson songs
black_hole_sun = jackson.songs.create(name: 'Black Hole Sun', artist: 'Soundgarden', chords: 'E Major, G Major, D Major, C# Minor, C Major, B Major')
stargazer = jackson.songs.create(name: 'Stargazer', artist: 'Mother Love Bone', chords: 'G Major, C Major, E Minor, G5, F Major, A Minor, D Major, Dsus4, Dsus2')
down_in_a_hole = jackson.songs.create(name: 'Down in a Hole', artist: 'Alice in Chains', chords: 'A Minor, G Major, D Major')

# lauren songs
free_fallin = lauren.songs.create(name: 'Free Fallin', artist: 'Tom Petty', chords: 'E Major, Asus4, B Major')
fireflies = lauren.songs.create(name: 'Fireflies', artist: 'Owl City', chords: 'G Major, C Major, F Major, E Minor, A Minor, D Major')
simple_man = lauren.songs.create(name: 'Simple Man', artist: 'Lynyrd Skynyrd', chords: 'C Major, G Major, A Minor')

# smudge songs
lateralus = smudge.songs.create(name: 'Lateralus', artist: 'Tool', chords: 'F Major, G Major, A Minor, C Major, F Major')
yeah_boy_and_doll_face = smudge.songs.create(name: 'Yeah Boy and Doll Face', artist: 'Pierce the Veil', chords: 'C# Minor, B Major, G#, F#, E Major, A Major')
snow = smudge.songs.create(name: 'Snow (Hey Oh)', artist: 'Red Hot Chili Peppers', chords: 'E Minor, C Major, G Major, D Major')
