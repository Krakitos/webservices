package etu.polytech.ws.rest.data;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.Date;
import java.util.List;

/**
 * Created by momo- on 06/10/2015.
 */
@Entity
public class Sejour {

    @Id
    @GenericGenerator(name="sejourgen" , strategy="increment")
    @GeneratedValue(generator="sejourgen")
    @Column(name = "numsej")
    private int id;

    @OneToOne
    @JoinColumn(name = "numcli")
    private Client client;

    @OneToOne
    @JoinColumn(name = "numempl")
    private Emplacement emplacement;

    @Column(name = "datedebsej")
    @Temporal(TemporalType.DATE)
    private Date debutSejour;

    @Column(name = "datefinsej")
    @Temporal(TemporalType.DATE)
    private Date finSejour;

    @Column(name = "nbpersonnes")
    private int nbPersonne;

    @OneToMany(fetch = FetchType.LAZY, mappedBy ="id.sejour")
    private List<Activite> activites;

    public Sejour() {}

    public Sejour(Client client, Emplacement emplacement,
                  LocalDateTime debutSejour, LocalDateTime finSejour,
                  int nbPersonne) {
        this.client = client;
        this.emplacement = emplacement;
        this.debutSejour = Date.from(debutSejour.toInstant(ZoneOffset.UTC));
        this.finSejour = Date.from(finSejour.toInstant(ZoneOffset.UTC));
        this.nbPersonne = nbPersonne;
    }

    public int getId() {
        return id;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public void setEmplacement(Emplacement emplacement) {
        this.emplacement = emplacement;
    }

    public void setDebutSejour(Date debutSejour) {
        this.debutSejour = debutSejour;
    }

    public void setFinSejour(Date finSejour) {
        this.finSejour = finSejour;
    }

    public void setNbPersonne(int nbPersonne) {
        this.nbPersonne = nbPersonne;
    }

    public void setActivites(List<Activite> activites) {
        this.activites = activites;
    }

    public Client getClient() {
        return client;
    }

    public Emplacement getEmplacement() {
        return emplacement;
    }

    public Date getDebutSejour() {
        return debutSejour;
    }

    public Date getFinSejour() {
        return finSejour;
    }

    public int getNbPersonne() {
        return nbPersonne;
    }

    public List<Activite> getActivites() {
        return activites;
    }

    @Override
    public String toString() {
        return "Sejour{" +
                "id=" + id +
                ", client=" + client +
                ", emplacement=" + emplacement +
                ", debutSejour=" + debutSejour +
                ", finSejour=" + finSejour +
                ", nbPersonne=" + nbPersonne +
                ", activites=" + activites +
                '}';
    }
}
